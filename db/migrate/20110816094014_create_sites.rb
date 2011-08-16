class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.string :lang_code

      t.timestamps
    end
  end
end
