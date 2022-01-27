class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      def change
        create_table :ranks do |t|
          t.string :name, limit: 20
          t.timestamps
        end
      end
      t.timestamps
    end
  end
end
