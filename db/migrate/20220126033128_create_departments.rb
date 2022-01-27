class CreateDepartments < ActiveRecord::Migration[7.0]
  def change
    create_table :departments do |t|
      t.string :name, limit: 20
      t.text :description, limit: 200
      t.timestamps
    end
  end
end
