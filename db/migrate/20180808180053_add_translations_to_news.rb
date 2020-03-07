class AddTranslationsToNews < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up do
        News.create_translation_table! title: :string, description: :text, short_description: :text
      end

      dir.down do
        News.drop_translation_table!
      end
    end
  end
end
