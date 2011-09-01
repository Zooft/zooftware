class CreateFaqEntries < ActiveRecord::Migration
  def change
    create_table :faq_entries do |t|
      t.string :question
      t.text :answer
      t.integer :position, :default=>0
      t.references :site

      t.timestamps
    end
    add_index :faq_entries, :site_id
  end
end
