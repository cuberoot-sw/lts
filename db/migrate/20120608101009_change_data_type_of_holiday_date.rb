class ChangeDataTypeOfHolidayDate < ActiveRecord::Migration
  def up
     change_table :holidays do |t|
      t.change :date, :date
     end
  end

  def down
    case ActiveRecord::Base.connection
      when ActiveRecord::ConnectionAdapters::PostgreSQLAdapter
          connection.execute(%q{
             alter table holidays
             alter column date type timestamp without time zone using to_timestamp(date)
          })
      when ActiveRecord::ConnectionAdapters::MySQLAdapter
        change_table :holidays do |t|
          t.change :date, :datetime
        end
    end
  end
end
