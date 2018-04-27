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




ActiveRecord::Schema.define(version: 2018_04_27_070631) do



  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_selections", force: :cascade do |t|
    t.bigint "testing_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["testing_id"], name: "index_admin_selections_on_testing_id"
    t.index ["user_id"], name: "index_admin_selections_on_user_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "link"
    t.string "image"
    t.boolean "published", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
  end

  create_table "bbcs", force: :cascade do |t|
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "testings", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "link"
    t.string "image"
    t.boolean "published", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "email", null: false
    t.boolean "admin", default: false
    t.boolean "subscribed", default: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.string "profile_pic"
    t.string "description"
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  create_table "welcome_indices", force: :cascade do |t|
    t.bigint "article_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_welcome_indices_on_article_id"
    t.index ["user_id"], name: "index_welcome_indices_on_user_id"
  end

  add_foreign_key "admin_selections", "testings"
  add_foreign_key "admin_selections", "users"
  add_foreign_key "welcome_indices", "articles"
  add_foreign_key "welcome_indices", "users"
end
