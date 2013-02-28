class ChangeDataTypeForUsersAlternatePhoneNumber < ActiveRecord::Migration
  def up
    case ActiveRecord::Base.connection
      when ActiveRecord::ConnectionAdapters::PostgreSQLAdapter
        connection.execute(%q{
          ALTER TABLE users ALTER alternate_phone_number TYPE BIGINT
        })
      when ActiveRecord::ConnectionAdapters::Mysql2Adapter
        execute <<-SQL
          ALTER TABLE users CHANGE alternate_phone_number
          alternate_phone_number BIGINT(20)
        SQL
    end
  end

  def down
    case ActiveRecord::Base.connection
      when ActiveRecord::ConnectionAdapters::PostgreSQLAdapter
        connection.execute(%q{

        })
      when ActiveRecord::ConnectionAdapters::Mysql2Adapter
        execute <<-SQL
          ALTER TABLE users CHANGE alternate_phone_number
          alternate_phone_number INT(11)
        SQL
    end
  end
end
