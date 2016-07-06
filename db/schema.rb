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

ActiveRecord::Schema.define(version: 20160706071441) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "bookings", force: :cascade do |t|
    t.string   "Service_type"
    t.string   "status"
    t.integer  "user_id"
    t.integer  "store_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "store_category_id"
    t.integer  "store_sub_category_id"
    t.date     "date"
    t.time     "time"
    t.boolean  "confirmed"
    t.string   "booking_date"
    t.string   "attachment"
    t.string   "address"
  end

  add_index "bookings", ["store_category_id"], name: "index_bookings_on_store_category_id"
  add_index "bookings", ["store_id"], name: "index_bookings_on_store_id"
  add_index "bookings", ["store_sub_category_id"], name: "index_bookings_on_store_sub_category_id"
  add_index "bookings", ["user_id"], name: "index_bookings_on_user_id"

  create_table "business_companies_users", force: :cascade do |t|
    t.integer "business_company_id"
    t.integer "user_id"
  end

  add_index "business_companies_users", ["business_company_id"], name: "index_business_companies_users_on_business_company_id"
  add_index "business_companies_users", ["user_id"], name: "index_business_companies_users_on_user_id"

  create_table "business_individuals_users", force: :cascade do |t|
    t.integer "business_individual_id"
    t.integer "user_id"
  end

  add_index "business_individuals_users", ["business_individual_id"], name: "index_business_individuals_users_on_business_individual_id"
  add_index "business_individuals_users", ["user_id"], name: "index_business_individuals_users_on_user_id"

  create_table "store_categories", force: :cascade do |t|
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "store_sub_categories", force: :cascade do |t|
    t.string   "subcategory"
    t.integer  "store_category_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "store_sub_categories", ["store_category_id"], name: "index_store_sub_categories_on_store_category_id"

  create_table "stores", force: :cascade do |t|
    t.string   "store_name"
    t.string   "name"
    t.string   "mobile"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "authentication_token"
    t.string   "picture"
  end

  add_index "stores", ["authentication_token"], name: "index_stores_on_authentication_token", unique: true
  add_index "stores", ["email"], name: "index_stores_on_email", unique: true
  add_index "stores", ["reset_password_token"], name: "index_stores_on_reset_password_token", unique: true

  create_table "stores_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "store_id"
  end

  add_index "stores_users", ["store_id"], name: "index_stores_users_on_store_id"
  add_index "stores_users", ["user_id"], name: "index_stores_users_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "mobile"
    t.string   "house_no"
    t.string   "locality"
    t.string   "pincode"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.string   "picture"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
