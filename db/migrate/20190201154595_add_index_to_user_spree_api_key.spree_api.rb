# This migration comes from spree_api (originally 20131017162334)
class AddIndexToUserSpreeApiKey < ActiveRecord::Migration[4.2]
  def change
    unless false
      add_index :spree_users, :spree_api_key
    end
  end
end
