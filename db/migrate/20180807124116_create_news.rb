class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.string :title
      t.text :description
      t.string :slug
      t.integer :author_id
      t.string :short_description
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.timestamps
    end

    add_index :news, :slug, unique: true
    add_index :news, :author_id
  end
end
