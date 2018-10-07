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

ActiveRecord::Schema.define(version: 2018_09_08_192403) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "temporary_storage_warehouse_transactions", force: :cascade do |t|
    t.string "vehicle_number"
    t.string "vehicle_type"
    t.string "state"
    t.integer "pallet_count"
    t.datetime "date"
    t.datetime "checkin_date"
    t.datetime "checkout_date"
    t.boolean "checkin_notified"
    t.boolean "checkout_notified"
    t.string "driver_fullname"
    t.string "phone"
    t.string "deal_type"
    t.string "country_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "temporary_storage_warehouses", force: :cascade do |t|
    t.string "region_name"
    t.string "address"
    t.integer "region_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "role"
    t.string "password_digest"
    t.bigint "temporary_storage_warehouse_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["temporary_storage_warehouse_id"], name: "index_users_on_temporary_storage_warehouse_id"
  end

  add_foreign_key "users", "temporary_storage_warehouses"
end
