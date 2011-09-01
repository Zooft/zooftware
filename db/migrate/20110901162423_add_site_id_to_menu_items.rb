class AddSiteIdToMenuItems < ActiveRecord::Migration
  def change
    add_column :menu_items, :site_id, :integer
    add_index :menu_items, :site_id
  end
end
