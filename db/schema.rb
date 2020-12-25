# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_25_155606) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "user_id", null: false
    t.boolean "is_available"
    t.datetime "begin_datetime"
    t.datetime "finish_datetime"
    t.string "location"
    t.boolean "buy"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "activity_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "activity_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activity_id"], name: "index_activity_users_on_activity_id"
    t.index ["user_id"], name: "index_activity_users_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "transaction_id"
    t.integer "num"
    t.integer "price"
    t.string "tel"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "state"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "ticket_types", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.integer "quantity"
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "activity_id"
    t.datetime "sell_start"
    t.datetime "sell_deadline"
    t.index ["activity_id"], name: "index_ticket_types_on_activity_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "location"
    t.integer "total_price"
    t.string "notice"
    t.string "qr_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "ticket_type_id"
    t.bigint "order_id"
    t.string "ticket_number"
    t.index ["order_id"], name: "index_tickets_on_order_id"
    t.index ["ticket_type_id"], name: "index_tickets_on_ticket_type_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "password"
    t.string "name"
    t.string "account_name"
    t.boolean "creator"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "fb_uid"
    t.string "fb_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["fb_uid"], name: "index_users_on_fb_uid"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "activities", "users"
  add_foreign_key "activity_users", "activities"
  add_foreign_key "activity_users", "users"
  add_foreign_key "orders", "users"
  add_foreign_key "ticket_types", "activities"
  add_foreign_key "tickets", "orders"
  add_foreign_key "tickets", "ticket_types"
end
