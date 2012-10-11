class ChangeYearTypeSetups < ActiveRecord::Migration
  def up
    case ActiveRecord::Base.connection
      when ActiveRecord::ConnectionAdapters::PostgreSQLAdapter
          connection.execute(%q{
             alter table setups
             alter column year type integer using cast(extract(epoch from '2011-11-15 00:00:00'::timestamp without time zone) as integer)
          })
      when ActiveRecord::ConnectionAdapters::MySQLAdapter
          change_column :setups, :year, :integer
      end
  end

  def down
    case ActiveRecord::Base.connection
      when ActiveRecord::ConnectionAdapters::PostgreSQLAdapter
          connection.execute(%q{
             alter table setups
             alter column year type timestamp without time zone
          })
      when ActiveRecord::ConnectionAdapters::MySQLAdapter
          change_column :setups, :year, :datetime
      end
  end
end

# using to_timestamp(date)
