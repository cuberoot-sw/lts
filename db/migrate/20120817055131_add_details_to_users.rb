class AddDetailsToUsers < ActiveRecord::Migration
  def up
    add_column :users, :phone_number, :integer
    add_column :users, :emergency_phone_number, :integer
    add_column :users, :emergency_contact_person, :string
    add_column :users, :alernate_phone_number, :integer
    add_column :users, :blood_group, :string
    add_column :users, :official_email_id, :string
    add_column :users, :alternate_email_id, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :local_address, :string
    add_column :users, :permanent_address, :string
  end

  def down
    remove_column :users, :phone_number
    remove_column :users, :emergency_phone_number
    remove_column :users, :emergency_contact_person
    remove_column :users, :alernate_phone_number
    remove_column :users, :blood_group
    remove_column :users, :official_email_id
    remove_column :users, :alternate_email_id
    remove_column :users, :date_of_birth
    remove_column :users, :local_address
    remove_column :users, :permanent_address
  end
end
