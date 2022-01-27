class AddDepartmentsRefToEmployee < ActiveRecord::Migration[7.0]
  def self.up
    add_reference :employees, :department, foreign_keys: true
    change_column :employees, :department_id, :integer, foreign_keys: true
  end

  def self.down
    remove_column :employees, :department_id
  end
end
