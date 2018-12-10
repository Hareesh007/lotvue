class ChangeRoleIdToArrayInUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :role_id
    add_column :users, :role_id, :integer, array: true, default: []
  end
end
