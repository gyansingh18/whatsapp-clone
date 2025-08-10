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

ActiveRecord::Schema[7.1].define(version: 2025_08_10_231150) do
  create_table "chat_users", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "chat_id", null: false
    t.string "role", default: "member"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_chat_users_on_chat_id"
    t.index ["user_id", "chat_id"], name: "index_chat_users_on_user_id_and_chat_id", unique: true
    t.index ["user_id"], name: "index_chat_users_on_user_id"
  end

  create_table "chats", force: :cascade do |t|
    t.string "name"
    t.string "chat_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_type"], name: "index_chats_on_chat_type"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.integer "user_id", null: false
    t.integer "chat_id", null: false
    t.datetime "read_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_messages_on_chat_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.boolean "online", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["online"], name: "index_users_on_online"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "chat_users", "chats"
  add_foreign_key "chat_users", "users"
  add_foreign_key "messages", "chats"
  add_foreign_key "messages", "users"
end
