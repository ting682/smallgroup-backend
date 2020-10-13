# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_13_140253) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "passages", force: :cascade do |t|
    t.text "content"
    t.string "book"
    t.string "chapter"
    t.string "verse"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_passages_on_user_id"
  end

  create_table "topic_passages", force: :cascade do |t|
    t.bigint "passage_id"
    t.bigint "user_id"
    t.bigint "topic_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["passage_id"], name: "index_topic_passages_on_passage_id"
    t.index ["topic_id"], name: "index_topic_passages_on_topic_id"
    t.index ["user_id"], name: "index_topic_passages_on_user_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_topics_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address"
    t.string "password_digest"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "passages", "users"
  add_foreign_key "topics", "users"
end
