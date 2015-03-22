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

ActiveRecord::Schema.define(version: 20150322120751) do

  create_table "logs", force: :cascade do |t|
    t.integer  "ticket_id",    limit: 4
    t.integer  "status_id",    limit: 4
    t.integer  "assigned_id",  limit: 4
    t.integer  "committer_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "status", force: :cascade do |t|
    t.string "title", limit: 255
  end

  create_table "teams", force: :cascade do |t|
    t.string "title",       limit: 255
    t.string "short_title", limit: 255
  end

  create_table "tickets", force: :cascade do |t|
    t.string   "customer_name",  limit: 255
    t.string   "customer_email", limit: 255
    t.integer  "team_id",        limit: 4
    t.string   "subject",        limit: 255
    t.string   "description",    limit: 255
    t.integer  "status_id",      limit: 4
    t.integer  "user_id",        limit: 4
    t.string   "ticket_name",    limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

end
