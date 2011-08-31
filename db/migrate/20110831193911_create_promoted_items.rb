class CreatePromotedItems < ActiveRecord::Migration
  def change
    create_table :promoted_items do |t|
      t.string :title
      t.text :body
      t.string :linkable_type
      t.integer :linkable_id
      t.integer :position, :default => 0
      t.string :image_file_name
      t.integer :image_file_size
      t.string :image_content_type
      t.references :promoted_group
      t.references :site

      t.timestamps
    end

    add_index :promoted_items, [:linkable_type, :linkable_id]
    add_index :promoted_items, :promoted_group_id
    add_index :promoted_items, :site_id

  end
end
