class CreateReferences < ActiveRecord::Migration[6.0]
  def change
    create_table :references do |t|
      t.string :name
      t.string :position
      t.string :company
      t.boolean :live
      t.text :html
      t.attachment :photo
      t.datetime :released_at, null: false

      t.timestamps
    end
  end
end
