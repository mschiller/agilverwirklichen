class DropCkeditorAssets < ActiveRecord::Migration[6.0]
def self.down
  create_table :ckeditor_assets do |t|
    t.string :data_file_name, null: false
    t.string :data_content_type
    t.integer :data_file_size
    t.string :data_fingerprint
    t.string :type, limit: 30

    t.integer :width
    t.integer :height

    t.timestamps null: false
  end

  add_index :ckeditor_assets, :type
end

def self.up
  drop_table :ckeditor_assets
end
end
