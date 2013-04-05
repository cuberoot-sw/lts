class AddLeaveTypeToLeaves < ActiveRecord::Migration
  def change
    add_column :leaves, :leave_type, :string
  end
end
