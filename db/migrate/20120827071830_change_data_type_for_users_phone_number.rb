class ChangeDataTypeForUsersPhoneNumber < ActiveRecord::Migration
  def up
    case ActiveRecord::Base.connection
      when ActiveRecord::ConnectionAdapters::PostgreSQLAdapter
        connection.execute(%q{
          ALTER TABLE users ALTER phone_number TYPE BIGINT
        })
      when ActiveRecord::ConnectionAdapters::MySQLAdapter
        execute <<-SQL
          ALTER TABLE users CHANGE phone_number phone_number BIGINT(20)
        SQL
    end
  end

  def down
        case ActiveRecord::Base.connection
      when ActiveRecord::ConnectionAdapters::PostgreSQLAdapter
        connection.execute(%q{
          ALTER TABLE users ALTER phone_number TYPE INTEGER
        })
      when ActiveRecord::ConnectionAdapters::MySQLAdapter
        execute <<-SQL
          ALTER TABLE users CHANGE phone_number phone_number INT(11)
        SQL
    end
  end
end
