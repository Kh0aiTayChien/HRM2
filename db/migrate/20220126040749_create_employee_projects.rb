class CreateEmployeeProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :employee_projects do |t|
        t.string :time_assign, limit: 30

        t.timestamps
    end
  end
end
