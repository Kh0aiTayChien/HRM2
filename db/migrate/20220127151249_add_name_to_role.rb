class AddNameToRole < ActiveRecord::Migration[7.0]
  def change
    add_column :roles, :name, :string, limit: 10
  end
end
