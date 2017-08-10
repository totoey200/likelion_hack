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

ActiveRecord::Schema.define(version: 20170810083000) do

  create_table "pics", force: :cascade do |t|
    t.integer  "studyID"
    t.string   "stuMaster"
    t.integer  "studentID"
    t.string   "image"
    t.datetime "certiDate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "room_name"
    t.time     "room_time"
    t.integer  "room_limit"
    t.date     "room_last"
    t.string   "certi"
    t.text     "comment"
    t.string   "captain"
    t.string   "crew",       default: "--- []\n"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "studies", force: :cascade do |t|
    t.string   "studyName"
    t.datetime "mDate"
    t.integer  "stuNo"
    t.string   "stuMaster"
    t.integer  "studyID"
    t.string   "certi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stulists", force: :cascade do |t|
    t.string   "nickname"
    t.integer  "studentID"
    t.integer  "studyID"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.integer  "parti",                  default: 100
    t.integer  "point",                  default: 100
    t.integer  "studyID",                default: 0
    t.boolean  "isMaster",               default: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
