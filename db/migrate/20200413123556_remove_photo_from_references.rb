class RemovePhotoFromReferences < ActiveRecord::Migration[6.0]
  def up
    remove_column :references, :photo_file_name
    remove_column :references, :photo_content_type
    remove_column :references, :photo_file_size
    remove_column :references, :photo_updated_at
  end

  def down
    add_column :references, :photo, :attachment
  end
end
