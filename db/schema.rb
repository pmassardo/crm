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

ActiveRecord::Schema.define(version: 20160903155647) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "accounts", force: :cascade do |t|
    t.integer  "account_type_id"
    t.integer  "user_id"
    t.string   "name"
    t.string   "phone"
    t.text     "notes"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "accounts", ["account_type_id"], name: "index_accounts_on_account_type_id", using: :btree
  add_index "accounts", ["user_id"], name: "index_accounts_on_user_id", using: :btree

  create_table "appointment_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "appointments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "appointment_type_id"
    t.text     "notes"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.float    "start_time"
    t.float    "end_time"
    t.date     "appointment_date"
  end

  add_index "appointments", ["appointment_type_id"], name: "index_appointments_on_appointment_type_id", using: :btree
  add_index "appointments", ["user_id"], name: "index_appointments_on_user_id", using: :btree

  create_table "attendants", force: :cascade do |t|
    t.integer  "appointment_id"
    t.integer  "contact_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "attendants", ["appointment_id"], name: "index_attendants_on_appointment_id", using: :btree
  add_index "attendants", ["contact_id"], name: "index_attendants_on_contact_id", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.integer  "account_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.text     "notes"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "email"
    t.boolean  "active",     default: true
  end

  add_index "contacts", ["account_id"], name: "index_contacts_on_account_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",            null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "accounts", "account_types"
  add_foreign_key "accounts", "users"
  add_foreign_key "appointments", "appointment_types"
  add_foreign_key "appointments", "users"
  add_foreign_key "attendants", "appointments"
  add_foreign_key "attendants", "contacts"
  add_foreign_key "contacts", "accounts"
end
