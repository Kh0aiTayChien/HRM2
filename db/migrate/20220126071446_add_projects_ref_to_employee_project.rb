class AddProjectsRefToEmployeeProject < ActiveRecord::Migration[7.0]
  def self.up
    add_reference :employee_projects, :project, foreign_keys: true
    change_column :employee_projects, :project_id, :integer, foreign_keys: true
  end

  def self.down
    remove_column :employee_projects, :project_id
  end
end
