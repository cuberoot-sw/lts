class AddDefaultValueToRole < ActiveRecord::Migration
  def up
    change_column :users, :role, :string, default: "employee"
  end

  def down
#    raise ActiveRecord::IrreversibleMigration, "Can't remove the default"
  end
end
