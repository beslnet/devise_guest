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

ActiveRecord::Schema.define(version: 20160718032712) do

  create_table "matches", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "matched_person_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "matches", ["matched_person_id"], name: "index_matches_on_matched_person_id"
  add_index "matches", ["person_id", "matched_person_id"], name: "index_matches_on_person_id_and_matched_person_id", unique: true
  add_index "matches", ["person_id"], name: "index_matches_on_person_id", unique: true

  create_table "people", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "ancestry"
    t.string   "sex"
    t.integer  "father_id"
    t.integer  "mother_id"
    t.integer  "current_spouse_id"
  end

  add_index "people", ["ancestry"], name: "index_people_on_ancestry"

  create_table "users", force: :cascade do |t|
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "person_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["person_id"], name: "index_users_on_person_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
