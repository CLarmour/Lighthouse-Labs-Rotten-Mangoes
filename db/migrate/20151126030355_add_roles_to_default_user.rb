class AddRolesToDefaultUser < ActiveRecord::Migration
  def change
    add_column :users, :roles, :text, default: ['user']
  end
end
