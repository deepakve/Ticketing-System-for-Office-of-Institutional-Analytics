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

ActiveRecord::Schema.define(version: 20151125170337) do

  create_table "tickets", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "job_title"
    t.string   "department"
    t.string   "phone_number"
    t.date     "date_needed_by"
    t.string   "email"
    t.string   "priority"
    t.string   "position"
    t.string   "type_of_request"
    t.string   "purpose"
    t.text     "description"
    t.string   "time_period"
    t.string   "student_type"
    t.string   "campus"
    t.integer  "irb",             limit: 8
    t.string   "grant_pi"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "user_id"
    t.string   "status"
  end

  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "email"
    t.boolean  "admin"
    t.string   "role"
    t.string   "first_name"
    t.string   "last_name"
  end

end
