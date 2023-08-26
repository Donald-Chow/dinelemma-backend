# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_26_072637) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "group_members", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "group_id", null: false
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_group_members_on_group_id"
    t.index ["user_id"], name: "index_group_members_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "list_bookmarks", force: :cascade do |t|
    t.bigint "restaurant_id", null: false
    t.bigint "restaurant_list_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_list_bookmarks_on_restaurant_id"
    t.index ["restaurant_list_id"], name: "index_list_bookmarks_on_restaurant_list_id"
  end

  create_table "restaurant_lists", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_restaurant_lists_on_user_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name", null: false
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "name"
    t.string "jti", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vote_sessions", force: :cascade do |t|
    t.string "name", default: -> { "CURRENT_TIMESTAMP" }
    t.bigint "group_id", null: false
    t.bigint "restaurant_list_id"
    t.bigint "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_vote_sessions_on_group_id"
    t.index ["restaurant_id"], name: "index_vote_sessions_on_restaurant_id"
    t.index ["restaurant_list_id"], name: "index_vote_sessions_on_restaurant_list_id"
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "vote_session_id", null: false
    t.bigint "restaurant_id", null: false
    t.integer "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_votes_on_restaurant_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
    t.index ["vote_session_id"], name: "index_votes_on_vote_session_id"
  end

  add_foreign_key "group_members", "groups"
  add_foreign_key "group_members", "users"
  add_foreign_key "list_bookmarks", "restaurant_lists"
  add_foreign_key "list_bookmarks", "restaurants"
  add_foreign_key "restaurant_lists", "users"
  add_foreign_key "vote_sessions", "groups"
  add_foreign_key "vote_sessions", "restaurant_lists"
  add_foreign_key "vote_sessions", "restaurants"
  add_foreign_key "votes", "restaurants"
  add_foreign_key "votes", "users"
  add_foreign_key "votes", "vote_sessions"
end
