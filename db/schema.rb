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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141129220332) do

  create_table "admin_users", force: true do |t|
    t.string   "first_name",      limit: 30,               null: false
    t.string   "last_name",       limit: 30,               null: false
    t.string   "email",           limit: 100, default: "", null: false
    t.string   "username",        limit: 25
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

  add_index "admin_users", ["username"], name: "index_admin_users_on_username", using: :btree

  create_table "admin_users_pages", id: false, force: true do |t|
    t.integer "admin_user_id"
    t.integer "page_id"
  end

  add_index "admin_users_pages", ["admin_user_id", "page_id"], name: "index_admin_users_pages_on_admin_user_id_and_page_id", using: :btree

  create_table "menus", force: true do |t|
    t.integer  "page_id"
    t.string   "title",                            null: false
    t.integer  "position",                         null: false
    t.string   "link",                             null: false
    t.string   "menu_class", default: "main_menu"
    t.boolean  "status",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "menus", ["page_id"], name: "index_menus_on_page_id", using: :btree

  create_table "pages", force: true do |t|
    t.integer  "subject_id"
    t.string   "name"
    t.integer  "permalink"
    t.integer  "position"
    t.boolean  "visible",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["permalink"], name: "index_pages_on_permalink", using: :btree
  add_index "pages", ["subject_id"], name: "index_pages_on_subject_id", using: :btree

  create_table "pages_widgets", id: false, force: true do |t|
    t.integer "page_id"
    t.integer "widget_id"
  end

  add_index "pages_widgets", ["page_id", "widget_id"], name: "index_pages_widgets_on_page_id_and_widget_id", using: :btree

  create_table "section_edits", force: true do |t|
    t.integer  "admin_user_id"
    t.integer  "section_id"
    t.string   "summary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "section_edits", ["admin_user_id", "section_id"], name: "index_section_edits_on_admin_user_id_and_section_id", using: :btree

  create_table "sections", force: true do |t|
    t.integer  "page_id"
    t.string   "name"
    t.integer  "position"
    t.boolean  "visible",      default: false
    t.string   "content_type"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sections", ["page_id"], name: "index_sections_on_page_id", using: :btree

  create_table "subjects", force: true do |t|
    t.string   "name"
    t.integer  "position"
    t.boolean  "visible",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.string  "username",        limit: 10
    t.string  "email"
    t.boolean "status",                     default: false
    t.string  "password_digest"
  end

  add_index "users", ["username"], name: "index_users_on_username", using: :btree

  create_table "widgets", force: true do |t|
    t.integer  "page_id"
    t.string   "widget_title"
    t.text     "widget_content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "widgets", ["page_id"], name: "index_widgets_on_page_id", using: :btree

end
