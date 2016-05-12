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

ActiveRecord::Schema.define(version: 20160510045229) do

  create_table "checkups", force: :cascade do |t|
    t.integer  "hospital_id", limit: 4
    t.string   "name",        limit: 255
    t.text     "detail",      limit: 65535
    t.integer  "price",       limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "coupon",      limit: 65535
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "homepage",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "access",       limit: 65535
    t.text     "logo_url",     limit: 65535
    t.integer  "entrance_fee", limit: 4
    t.text     "detail",       limit: 65535
  end

  create_table "fitnesses", force: :cascade do |t|
    t.integer  "company_id", limit: 4
    t.string   "name",       limit: 255
    t.text     "detail",     limit: 65535
    t.integer  "price",      limit: 4
    t.string   "place",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "image_url",  limit: 65535
    t.text     "coupon",     limit: 65535
  end

  create_table "health_statuses", force: :cascade do |t|
    t.integer  "user_id",         limit: 4
    t.string   "medical_history", limit: 255
    t.string   "illness",         limit: 255
    t.integer  "weight",          limit: 4
    t.integer  "height",          limit: 4
    t.integer  "blood_pressure",  limit: 4
    t.integer  "fat_percentage",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hospitals", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "place",      limit: 255
    t.text     "detail",     limit: 65535
    t.string   "homepage",   limit: 255
    t.text     "image",      limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tel",        limit: 255
    t.text     "access",     limit: 65535
  end

  create_table "insurances", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "fee",        limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "steps", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "step_num",   limit: 4
    t.string   "training",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "name",                   limit: 255
    t.string   "sex",                    limit: 255
    t.date     "birth_date"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
