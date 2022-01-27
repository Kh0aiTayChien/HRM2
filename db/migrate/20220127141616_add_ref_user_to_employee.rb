class AddRefUserToEmployee < ActiveRecord::Migration[7.0]
  def self.up
    add_reference :employees, :user, foreign_keys: true
    change_column :employees, :user_id, :integer,foreign_keys:true
  end

  def self.down
    remove_column :employees, :user_id
  end
end
