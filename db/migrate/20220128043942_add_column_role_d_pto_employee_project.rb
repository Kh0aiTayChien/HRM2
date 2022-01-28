class AddColumnRoleDPtoEmployeeProject < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :is_pm,:integer
  end
end
