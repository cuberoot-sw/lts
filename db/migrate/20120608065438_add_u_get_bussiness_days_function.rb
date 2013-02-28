class AddUGetBussinessDaysFunction < ActiveRecord::Migration
  def up
    case ActiveRecord::Base.connection
      when ActiveRecord::ConnectionAdapters::PostgreSQLAdapter
          connection.execute(%q{
          CREATE function uGetBussinessDays(in_sdate DATE,
           in_edate DATE) RETURNS VARCHAR(100) AS $$
           DECLARE
            l_count INT;
            l_sdate DATE;

           BEGIN
            l_sdate = in_sdate;

            CREATE TEMPORARY TABLE IF NOT EXISTS _tblBussinessDays(BussinessDays date);
            CREATE TEMPORARY TABLE IF NOT EXISTS _tblHolidaysDays(Offdays date);

             delete from _tblBussinessDays;
             delete from _tblHolidaysDays;

             WHILE l_sdate <= in_edate LOOP

              IF (to_char(l_sdate, 'day') = 'Sunday' ) THEN
                 INSERT INTO _tblHolidaysDays VALUES(l_sdate);
              ELSIF ( to_char(l_sdate, 'day') = 'Saturday' ) THEN
                 INSERT INTO _tblHolidaysDays VALUES(l_sdate);
              ELSE
                 INSERT INTO _tblBussinessDays VALUES(l_sdate);
              END IF;

               l_sdate = l_sdate + '1 day'::INTERVAL;

             END LOOP;

             SELECT count(BussinessDays) INTO l_count FROM _tblBussinessDays;
             return l_count ;
           END;
           $$ language plpgsql;
          })
      when ActiveRecord::ConnectionAdapters::Mysql2Adapter
        execute "
          CREATE function `uGetBussinessDays`(in_sDate DATE,
           in_eDate DATE) RETURNS VARCHAR(100)
          BEGIN
          DECLARE l_count INT;
          DECLARE l_sDate DATE;
          SET l_sDate = in_sDate;

          CREATE TEMPORARY TABLE IF NOT EXISTS _tblBussinessDays\
            (BussinessDays date);
          CREATE TEMPORARY TABLE IF NOT EXISTS _tblHolidaysDays(Offdays date);

          delete from _tblBussinessDays;
          delete from _tblHolidaysDays;

          WHILE l_sDate <= in_eDate DO

            IF (DAYNAME(l_sDate) = 'Sunday' ) THEN
              INSERT INTO _tblHolidaysDays VALUES(l_sDate);
            ELSEIF ( DAYNAME(l_sDate) = 'Saturday' ) THEN
              INSERT INTO _tblHolidaysDays VALUES(l_sDate);
            ELSE
              INSERT INTO _tblBussinessDays VALUES(l_sDate);
            END IF;

            SET l_sDate = DATE_ADD(l_sDate,INTERVAL 1 DAY);

          END WHILE;

          SELECT count(BussinessDays) INTO l_count FROM _tblBussinessDays;
          return l_count;
          END
        "
      end
  end

  def down
        case ActiveRecord::Base.connection
      when ActiveRecord::ConnectionAdapters::PostgreSQLAdapter
          connection.execute(%q{
             drop function uGetBussinessDays(DATE, DATE)
          })
      when ActiveRecord::ConnectionAdapters::Mysql2Adapter
        execute "drop function `uGetBussinessDays`(DATE,DATE);"
      end
  end
end
