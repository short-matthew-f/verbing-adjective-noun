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

ActiveRecord::Schema.define(version: 20150325102434) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "euphemisms", force: :cascade do |t|
    t.integer  "verb_id",      null: false
    t.integer  "adjective_id", null: false
    t.integer  "noun_id",      null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "euphemisms", ["verb_id", "adjective_id", "noun_id"], name: "index_euphemisms_on_verb_id_and_adjective_id_and_noun_id", unique: true, using: :btree

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id",      null: false
    t.integer  "euphemism_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "likes", ["euphemism_id"], name: "index_likes_on_euphemism_id", using: :btree
  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "token",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["token"], name: "index_users_on_token", using: :btree

  create_table "words", force: :cascade do |t|
    t.string   "part_of_speech", null: false
    t.string   "content",        null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "words", ["content"], name: "index_words_on_content", using: :btree
  add_index "words", ["part_of_speech"], name: "index_words_on_part_of_speech", using: :btree

end
