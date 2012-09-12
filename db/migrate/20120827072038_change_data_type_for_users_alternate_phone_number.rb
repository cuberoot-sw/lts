class ChangeDataTypeForUsersAlternatePhoneNumber < ActiveRecord::Migration
  def up
    execute <<-SQL
     ALTER TABLE users CHANGE alternate_phone_number alternate_phone_number BIGINT(20)
    SQL
  end

  def down
    execute <<-SQL
     ALTER TABLE users CHANGE alternate_phone_number alternate_phone_number INT(11)
    SQL

  end
end
