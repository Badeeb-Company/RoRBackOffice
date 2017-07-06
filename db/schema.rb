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

ActiveRecord::Schema.define(version: 20170706204227) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "notifications", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "photo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.string   "description"
  end

  create_table "promotion_photos", force: :cascade do |t|
    t.integer  "promotion_id"
    t.string   "photo"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["promotion_id"], name: "index_promotion_photos_on_promotion_id", using: :btree
  end

  create_table "promotions", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.date     "due_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "dynamic_link"
  end

  create_table "settings", force: :cascade do |t|
    t.string   "key"
    t.string   "description"
    t.string   "value"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",               default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  create_table "vendors", force: :cascade do |t|
    t.integer  "promotion_id"
    t.string   "name"
    t.string   "vendor_type"
    t.string   "phone_number"
    t.string   "mobile_number"
    t.string   "governorate"
    t.string   "address"
    t.float    "lat"
    t.float    "lng"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["promotion_id"], name: "index_vendors_on_promotion_id", using: :btree
  end

  add_foreign_key "promotion_photos", "promotions"
  add_foreign_key "vendors", "promotions"
end
