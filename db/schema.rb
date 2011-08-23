# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110823171728) do

  create_table "domains", :force => true do |t|
    t.string   "domain"
    t.integer  "site_id"
    t.boolean  "is_primary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "domains", ["site_id"], :name => "index_domains_on_site_id"

  create_table "menu_groups", :force => true do |t|
    t.string   "name"
    t.string   "identifier"
    t.boolean  "is_default", :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menu_items", :force => true do |t|
    t.string   "title"
    t.integer  "page_id"
    t.string   "url"
    t.integer  "menu_group_id"
    t.integer  "position",      :default => 0
    t.string   "css_class"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "menu_items", ["menu_group_id"], :name => "index_menu_items_on_menu_group_id"
  add_index "menu_items", ["page_id"], :name => "index_menu_items_on_page_id"

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "content"
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["site_id", "slug"], :name => "index_pages_on_site_id_and_slug"
  add_index "pages", ["site_id"], :name => "index_pages_on_site_id"

  create_table "resources", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "quantity"
    t.integer  "room_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "resources", ["room_id"], :name => "index_resources_on_room_id"

  create_table "rooms", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sites", :force => true do |t|
    t.string   "name"
    t.string   "lang_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",    :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",                       :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.boolean  "is_admin",                              :default => false
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

  add_foreign_key "menu_items", "menu_groups", :name => "menu_items_menu_group_id_fk"
  add_foreign_key "menu_items", "pages", :name => "menu_items_page_id_fk"

end
