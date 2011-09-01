class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.datetime :event_date
      t.references :site
      t.timestamps
    end

    add_index :events, :site_id
  end
end
