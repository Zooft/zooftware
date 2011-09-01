class CreateBlogEntries < ActiveRecord::Migration
  def change
    create_table :blog_entries do |t|
      t.string :title
      t.text :lead
      t.text :content
      t.references :site
      t.string :slug

      t.timestamps
    end
    add_index :blog_entries, :site_id
    add_index :blog_entries, :slug
  end
end
