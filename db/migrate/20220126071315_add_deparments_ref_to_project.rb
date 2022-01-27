class AddDeparmentsRefToProject < ActiveRecord::Migration[7.0]
  def self.up
    add_reference :projects, :department, foreign_keys: true
    change_column :projects, :department_id, :integer, foreign_keys: true
  end

  def self.down
    remove_column :projects, :department_id
  end
end
