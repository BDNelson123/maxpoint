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

ActiveRecord::Schema.define(:version => 20130709001741) do

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_uid",                     :null => false
    t.string   "data_name",                    :null => false
    t.string   "data_mime_type"
    t.integer  "data_size"
    t.integer  "assetable_id"
    t.string   "assetable_type", :limit => 30
    t.string   "type",           :limit => 30
    t.integer  "data_width"
    t.integer  "data_height"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "cms_categories", :force => true do |t|
    t.string   "name"
    t.integer  "locality_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "slug"
  end

  create_table "cms_comments", :force => true do |t|
    t.integer  "post_id"
    t.string   "email"
    t.string   "name"
    t.text     "body"
    t.integer  "parent_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "website"
    t.integer  "approved_by_id"
  end

# Could not dump table "cms_components" because of following StandardError
#   Unknown type 'hstore' for column 'data'

  create_table "cms_configurations", :force => true do |t|
    t.string   "name"
    t.integer  "default_locality_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

# Could not dump table "cms_links" because of following StandardError
#   Unknown type 'hstore' for column 'data'

  create_table "cms_localities", :force => true do |t|
    t.string   "slug"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "cms_pages", :force => true do |t|
    t.integer  "locality_id"
    t.integer  "parent_id"
    t.string   "slug"
    t.string   "title"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.text     "meta_description"
    t.text     "meta_keywords"
    t.string   "type"
    t.boolean  "published",        :default => true
  end

  create_table "cms_posts", :force => true do |t|
    t.integer  "locality_id"
    t.integer  "author_id"
    t.string   "slug"
    t.string   "title"
    t.text     "description"
    t.text     "body"
    t.boolean  "published"
    t.datetime "published_at"
    t.text     "meta_description"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "category_id"
    t.text     "meta_keywords"
  end

  create_table "cms_posts_cms_tags", :id => false, :force => true do |t|
    t.integer "post_id"
    t.integer "tag_id"
  end

  create_table "cms_tags", :force => true do |t|
    t.string   "name"
    t.integer  "posts_count"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "locality_id"
    t.string   "slug"
  end

  create_table "cms_users", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.boolean  "admin",           :default => false
  end

  add_index "cms_users", ["email"], :name => "index_cms_users_on_email", :unique => true

end
