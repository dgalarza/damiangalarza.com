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

ActiveRecord::Schema.define(:version => 20120319001306) do

  create_table "categories", :force => true do |t|
    t.string   "name",                           :null => false
    t.integer  "category_parent", :default => 0
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "post_id",                   :null => false
    t.integer  "wp_id"
    t.integer  "parent_id"
    t.string   "ip",         :limit => 100
    t.string   "username",   :limit => 32
    t.string   "email",      :limit => 80
    t.string   "website"
    t.text     "comment"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "comments", ["post_id"], :name => "index_comments_on_post_id"

  create_table "posts", :force => true do |t|
    t.integer  "user_id",                           :null => false
    t.integer  "category_id"
    t.boolean  "published"
    t.string   "title"
    t.text     "content",     :limit => 2147483647
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.integer  "wp_id"
    t.text     "excerpt"
    t.string   "subtitle",    :limit => 50
    t.string   "slug"
  end

  add_index "posts", ["category_id"], :name => "index_posts_on_category_id"
  add_index "posts", ["slug"], :name => "index_posts_on_slug", :unique => true
  add_index "posts", ["user_id"], :name => "index_posts_on_author_id"

  create_table "posts_tags", :force => true do |t|
    t.integer "post_id", :null => false
    t.integer "tag_id",  :null => false
  end

  add_index "posts_tags", ["post_id", "tag_id"], :name => "index_posts_tags_on_post_id_and_tag_id", :unique => true

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "tags", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tags", ["name"], :name => "index_tags_on_name", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email",                                :default => "",    :null => false
    t.string   "encrypted_password",                   :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
    t.boolean  "admin",                                :default => false
    t.string   "username",               :limit => 36
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
