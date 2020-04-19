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

ActiveRecord::Schema.define(version: 2020_04_19_051439) do

  create_table "comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "event_id", null: false
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_comments_on_event_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "event_chats", force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "user_id", null: false
    t.string "content"
    t.integer "event_chat_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_event_chats_on_event_id"
    t.index ["user_id"], name: "index_event_chats_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "description"
    t.string "place"
    t.integer "user_id", null: false
    t.integer "event_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "public"
    t.boolean "is_org"
    t.integer "organization_id"
    t.index ["organization_id"], name: "index_events_on_organization_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "hour_proposals", force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "user_id", null: false
    t.datetime "vote"
    t.boolean "is_voter_creator"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_hour_proposals_on_event_id"
    t.index ["user_id"], name: "index_hour_proposals_on_user_id"
  end

  create_table "invites", force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "sender_id"
    t.integer "target_id"
    t.string "title"
    t.boolean "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_invites_on_event_id"
    t.index ["sender_id"], name: "index_invites_on_sender_id"
    t.index ["target_id"], name: "index_invites_on_target_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "target_id"
    t.integer "sender_id"
    t.string "content"
    t.boolean "seen"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sender_id"], name: "index_messages_on_sender_id"
    t.index ["target_id"], name: "index_messages_on_target_id"
  end

  create_table "organization_users", force: :cascade do |t|
    t.integer "organization_id", null: false
    t.integer "user_id", null: false
    t.boolean "active"
    t.integer "organization_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_organization_users_on_organization_id"
    t.index ["user_id"], name: "index_organization_users_on_user_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.integer "organiztion_id"
    t.string "description"
    t.string "place"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "passwords", force: :cascade do |t|
    t.integer "psw_id"
    t.integer "user_id", null: false
    t.string "psw"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_passwords_on_user_id"
  end

  create_table "user_mails", force: :cascade do |t|
    t.integer "mail_id"
    t.integer "user_id", null: false
    t.boolean "active"
    t.string "mail"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_mails_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.boolean "admin"
    t.datetime "last"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "comments", "events"
  add_foreign_key "comments", "users"
  add_foreign_key "event_chats", "events"
  add_foreign_key "event_chats", "users"
  add_foreign_key "events", "organizations"
  add_foreign_key "events", "users"
  add_foreign_key "hour_proposals", "events"
  add_foreign_key "hour_proposals", "users"
  add_foreign_key "invites", "events"
  add_foreign_key "invites", "senders"
  add_foreign_key "invites", "user", column: "target_id"
  add_foreign_key "organization_users", "organizations"
  add_foreign_key "organization_users", "users"
  add_foreign_key "passwords", "users"
  add_foreign_key "user_mails", "users"
end
