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

ActiveRecord::Schema.define(version: 20150408224945) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text   "description"
    t.string "picture"
  end

  create_table "comissions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "product_id"
    t.integer "markup"
  end

  create_table "comments", force: :cascade do |t|
    t.string  "title"
    t.string  "content"
    t.integer "product_id"
    t.integer "user_id"
  end

  create_table "order_details", force: :cascade do |t|
    t.integer "order_id"
    t.integer "product_id"
    t.integer "price"
    t.boolean "fullfilled"
    t.string  "size"
    t.string  "frame_color"
    t.string  "frame_model"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "payment_id"
    t.integer "customer_id"
    t.integer "ordernumber"
    t.date    "shippingdate"
    t.string  "totalweight"
    t.date    "paymentdate"
    t.date    "orderdate"
  end

  create_table "payments", force: :cascade do |t|
    t.string  "payment_type"
    t.boolean "allowed"
  end

  create_table "product_details", force: :cascade do |t|
    t.string  "size"
    t.string  "frame_color"
    t.string  "frame_model"
    t.integer "product_id"
    t.integer "designer_markup"
    t.string  "weight"
  end

  create_table "products", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "designer_id"
    t.string   "name"
    t.string   "description"
    t.string   "image"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "username"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "building"
    t.string   "adress1"
    t.string   "ddress2"
    t.string   "city"
    t.string   "state"
    t.string   "paypal_email"
    t.string   "phone"
    t.string   "billingadress"
    t.string   "billingcity"
    t.string   "billingregion"
    t.string   "billingpostcode"
    t.string   "billingcountry"
    t.string   "shippingadress"
    t.string   "shippingcity"
    t.string   "shippingregion"
    t.string   "shippingpostcode"
    t.string   "shippingcountry"
    t.string   "picture"
    t.boolean  "artist",                 default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
