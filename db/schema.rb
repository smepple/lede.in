# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20120819192913) do

  create_table "bookmarks", :force => true do |t|
    t.integer  "user_id"
    t.integer  "bookmark_id"
    t.string   "description"
    t.string   "bookmark_hash"
    t.boolean  "private_source"
    t.float    "progress"
    t.datetime "progress_timestamp"
    t.boolean  "starred"
    t.datetime "time"
    t.string   "title"
    t.string   "bookmark_type"
    t.string   "url"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "bookmarks", ["bookmark_hash"], :name => "index_bookmarks_on_hash"
  add_index "bookmarks", ["bookmark_id", "bookmark_hash"], :name => "index_bookmarks_on_bookmark_id_and_hash", :unique => true
  add_index "bookmarks", ["bookmark_id"], :name => "index_bookmarks_on_bookmark_id"
  add_index "bookmarks", ["user_id", "bookmark_id"], :name => "index_bookmarks_on_user_id_and_bookmark_id", :unique => true
  add_index "bookmarks", ["user_id"], :name => "index_bookmarks_on_user_id"

  create_table "folders", :force => true do |t|
    t.integer  "user_id"
    t.integer  "folder_id"
    t.integer  "position"
    t.boolean  "sync_to_mobile"
    t.string   "title"
    t.string   "folder_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "folders", ["folder_id"], :name => "index_folders_on_folder_id"
  add_index "folders", ["user_id", "folder_id"], :name => "index_folders_on_user_id_and_folder_id", :unique => true
  add_index "folders", ["user_id"], :name => "index_folders_on_user_id"

  create_table "users", :force => true do |t|
    t.integer  "x_auth_uid"
    t.string   "x_auth_username"
    t.string   "oauth_token"
    t.string   "oauth_token_secret"
    t.string   "email"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["oauth_token"], :name => "index_users_on_oauth_token", :unique => true
  add_index "users", ["oauth_token_secret"], :name => "index_users_on_oauth_token_secret", :unique => true
  add_index "users", ["x_auth_uid"], :name => "index_users_on_x_auth_uid", :unique => true
  add_index "users", ["x_auth_username"], :name => "index_users_on_x_auth_username", :unique => true

end
