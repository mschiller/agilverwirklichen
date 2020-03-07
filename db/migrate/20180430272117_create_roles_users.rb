class CreateRolesUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :roles_users, force: true do |t|
      t.integer :role_id
      t.integer :user_id

      t.timestamps
    end
    add_index :roles_users, :role_id
    add_index :roles_users, :user_id
    add_index :roles_users, [:user_id, :role_id]
  end
end
