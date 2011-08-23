class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :title
      t.references :page
      t.string :url
      t.references :menu_group
      t.integer :position, :default=>0
      t.string :css_class

      t.timestamps
    end
    add_index :menu_items, :page_id
    add_index :menu_items, :menu_group_id
    add_foreign_key :menu_items, :pages
    add_foreign_key :menu_items, :menu_groups
  end
end
