class AddColumnRoleToEmployeeProject < ActiveRecord::Migration[7.0]
  def change
    add_column :employee_projects, :is_leader,:integer
  end
end
