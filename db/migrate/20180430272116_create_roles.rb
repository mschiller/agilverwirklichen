class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles, force: true do |t|
      t.string :name
      t.string :label

      t.timestamps
    end
  end
end
