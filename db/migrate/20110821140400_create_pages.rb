class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :slug
      t.text :content
      t.references :site

      t.timestamps
    end
    add_index :pages, :site_id
    add_index :pages, [:site_id, :slug]
  end
end
