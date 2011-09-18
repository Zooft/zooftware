class AddIdentifierToPages < ActiveRecord::Migration
  def change
    add_column :pages, :identifier, :string
    add_index :pages, [:site_id, :identifier], :unique=>true
  end
end
