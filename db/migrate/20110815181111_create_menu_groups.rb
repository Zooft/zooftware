class CreateMenuGroups < ActiveRecord::Migration
  def change
    create_table :menu_groups do |t|
      t.string :name
      t.string :identifier
      t.boolean :is_default, :default=>false

      t.timestamps
    end
  end
end
