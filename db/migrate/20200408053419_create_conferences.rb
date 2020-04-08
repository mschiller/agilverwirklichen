class CreateConferences < ActiveRecord::Migration[6.0]
  def change
    create_table :conferences do |t|
      t.string :room
      t.string :name
      t.string :password

      t.timestamps
    end
  end
end
