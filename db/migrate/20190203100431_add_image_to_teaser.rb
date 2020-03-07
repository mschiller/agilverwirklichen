class AddImageToTeaser < ActiveRecord::Migration[5.2]
  def change
    add_attachment :teasers, :image
  end
end
