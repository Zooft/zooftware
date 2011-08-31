class CreatePromotedGroups < ActiveRecord::Migration
  def change
    create_table :promoted_groups do |t|
      t.string :name
      t.string :identifier
      t.string :image_size

      t.timestamps
    end
  end
end
