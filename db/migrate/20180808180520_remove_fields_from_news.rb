class RemoveFieldsFromNews < ActiveRecord::Migration[5.2]
  def up
    remove_column :news, :author_id
    remove_column :news, :title
    remove_column :news, :description
    remove_column :news, :short_description
  end

  def down
    add_column :news, :author_id, :integer
    add_column :news, :title, :string
    add_column :news, :description, :text
    add_column :news, :short_description, :text
  end
end
