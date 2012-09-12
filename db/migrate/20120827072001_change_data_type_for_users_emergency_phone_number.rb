class ChangeDataTypeForUsersEmergencyPhoneNumber < ActiveRecord::Migration
  def up
    execute <<-SQL
     ALTER TABLE users CHANGE emergency_phone_number emergency_phone_number BIGINT(20)
    SQL

  end

  def down
    execute <<-SQL
     ALTER TABLE users CHANGE emergency_phone_number emergency_phone_number INT(11)
    SQL

  end
end
