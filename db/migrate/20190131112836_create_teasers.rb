class CreateTeasers < ActiveRecord::Migration[5.2]
  def change
    create_table :teasers do |t|
      t.string :name
      t.text :description
      t.boolean :live
      t.text :html

      t.timestamps
    end
  end
end
