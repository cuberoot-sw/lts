class AddDefaultValueToJoiningDate < ActiveRecord::Migration
  def up
    change_column :users, :joining_date, :date, default: "2012-01-01"
  end

  def down
#    raise ActiveRecord::IrreversibleMigration, "Can't remove the default"
  end
end
