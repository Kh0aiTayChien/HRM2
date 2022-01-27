class CreateEmployeeFiles < ActiveRecord::Migration[7.0]
  def change
    create_table :employee_files do |t|

      t.string :position, limit:20
      t.string :time_onboard, limit: 30
      t.timestamps
    end
  end
end
