class AddDefaultValueToRoleAttribute < ActiveRecord::Migration[5.2]
  def change
    change_column :roles, :status, :boolean, default: true
  end
end
