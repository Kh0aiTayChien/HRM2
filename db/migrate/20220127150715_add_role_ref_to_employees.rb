class AddRoleRefToEmployees < ActiveRecord::Migration[7.0]
  def self.up
    add_reference :employees, :role, foreign_keys: true
    change_column :employees, :role_id, :integer, foreign_keys: true
  end

  def self.down
    remove_column :employees, :role_id
    end
end
