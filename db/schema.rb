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

ActiveRecord::Schema[7.0].define(version: 2022_06_11_055849) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "active_sessions", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.string "user_agent"
    t.string "ip_address"
    t.string "remember_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_active_sessions_on_account_id"
    t.index ["remember_token"], name: "index_active_sessions_on_remember_token", unique: true
  end

  create_table "administrators", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "remember_token"
    t.datetime "remember_token_expires_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prompt_feeds", force: :cascade do |t|
    t.integer "ids", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "dates", default: [], array: true
  end

  create_table "prompts", force: :cascade do |t|
    t.string "prompt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "public_id"
  end

  add_foreign_key "active_sessions", "accounts", on_delete: :cascade
end
