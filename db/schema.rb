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

ActiveRecord::Schema.define(version: 2018_10_18_053430) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "ogrn"
    t.string "inn"
    t.string "kpp"
    t.string "uridicheskiy_address"
    t.string "real_address"
    t.string "bank_schet"
    t.string "bank_name"
    t.string "bank_bik"
    t.string "bank_city"
    t.string "bank_kor_schet"
    t.string "phone"
    t.string "email"
    t.string "agreement_num"
    t.integer "discount"
    t.integer "deferment_of_payment"
    t.string "director"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "company_contacts", force: :cascade do |t|
    t.string "name"
    t.string "middlename"
    t.string "lastname"
    t.string "phone"
    t.string "email"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_contacts_on_company_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "notification_type"
    t.string "recpient"
    t.string "subject"
    t.text "body"
    t.bigint "user_id"
    t.bigint "temporary_storage_warehouse_transaction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["temporary_storage_warehouse_transaction_id"], name: "temporary_storage_warehouse_transaction_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "selling_items", force: :cascade do |t|
    t.bigint "selling_id"
    t.text "description"
    t.integer "quantity"
    t.string "measure"
    t.float "price"
    t.integer "nds_percent"
    t.float "nds_total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["selling_id"], name: "index_selling_items_on_selling_id"
  end

  create_table "sellings", force: :cascade do |t|
    t.bigint "temporary_storage_warehouse_transaction_id"
    t.bigint "temporary_storage_warehouse_id"
    t.string "company_name"
    t.string "num"
    t.string "agreement_num"
    t.datetime "date"
    t.datetime "planned_payment_date"
    t.datetime "payed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["temporary_storage_warehouse_id"], name: "index_sellings_on_temporary_storage_warehouse_id"
    t.index ["temporary_storage_warehouse_transaction_id"], name: "index_sellings_on_temporary_storage_warehouse_transaction_id"
  end

  create_table "temporary_storage_warehouse_transactions", force: :cascade do |t|
    t.string "vehicle_number"
    t.string "vehicle_type"
    t.string "state"
    t.integer "pallet_count"
    t.datetime "date"
    t.datetime "checkin_date"
    t.datetime "checkout_date"
    t.datetime "bill_sent_at"
    t.boolean "checkin_notified"
    t.boolean "checkout_notified"
    t.string "driver_fullname"
    t.string "phone"
    t.string "deal_type"
    t.string "country_code"
    t.bigint "company_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_temporary_storage_warehouse_transactions_on_company_id"
    t.index ["user_id"], name: "index_temporary_storage_warehouse_transactions_on_user_id"
  end

  create_table "temporary_storage_warehouses", force: :cascade do |t|
    t.string "region_name"
    t.integer "region_num"
    t.string "name"
    t.string "ogrn"
    t.string "inn"
    t.string "kpp"
    t.string "uridicheskiy_address"
    t.string "real_address"
    t.string "bank_schet"
    t.string "bank_name"
    t.string "bank_bik"
    t.string "bank_city"
    t.string "bank_kor_schet"
    t.string "phone"
    t.string "email"
    t.string "director"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "role"
    t.string "password_digest"
    t.string "name"
    t.string "middlename"
    t.string "lastname"
    t.bigint "temporary_storage_warehouse_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["temporary_storage_warehouse_id"], name: "index_users_on_temporary_storage_warehouse_id"
  end

  add_foreign_key "company_contacts", "companies"
  add_foreign_key "notifications", "temporary_storage_warehouse_transactions"
  add_foreign_key "notifications", "users"
  add_foreign_key "selling_items", "sellings"
  add_foreign_key "sellings", "temporary_storage_warehouse_transactions"
  add_foreign_key "sellings", "temporary_storage_warehouses"
  add_foreign_key "temporary_storage_warehouse_transactions", "companies"
  add_foreign_key "temporary_storage_warehouse_transactions", "users"
  add_foreign_key "users", "temporary_storage_warehouses"
end
