class ChangeDataTypeForUsersPhoneNumber < ActiveRecord::Migration
  def up
    execute <<-SQL
     ALTER TABLE users CHANGE phone_number phone_number BIGINT(20)
    SQL
  end

  def down
    execute <<-SQL
     ALTER TABLE users CHANGE phone_number phone_number INT(11)
    SQL

  end
end
