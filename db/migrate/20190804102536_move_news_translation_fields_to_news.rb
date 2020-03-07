class MoveNewsTranslationFieldsToNews < ActiveRecord::Migration[5.2]
  def up
    drop_table :news_translations
    add_column :news, :title, :string
    add_column :news, :description, :text
    add_column :news, :short_description, :text
  end

  def down
    remove_column :news, :title
    remove_column :news, :description
    remove_column :news, :short_description
  end
end
