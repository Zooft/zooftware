class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name
      t.text :description
      t.integer :quantity
      t.references :room
      t.timestamps
    end
    add_index :resources, :room_id
  end
end
