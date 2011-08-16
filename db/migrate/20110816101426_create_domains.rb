class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.string :domain
      t.references :site
      t.boolean :is_primary, :default=>false

      t.timestamps
    end
    add_index :domains, :site_id
  end
end
