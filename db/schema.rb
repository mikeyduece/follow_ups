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

ActiveRecord::Schema.define(version: 2020_07_02_185330) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "care_requests", force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.bigint "patient_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patient_id"], name: "index_care_requests_on_patient_id"
    t.index ["status"], name: "index_care_requests_on_status"
    t.index ["user_id"], name: "index_care_requests_on_user_id"
  end

  create_table "conversation_conversations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "patient_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "follow_up_campaigns_id"
    t.index ["follow_up_campaigns_id"], name: "index_conversation_conversations_on_follow_up_campaigns_id"
    t.index ["patient_id"], name: "index_conversation_conversations_on_patient_id"
    t.index ["user_id", "patient_id"], name: "index_conversation_conversations_on_user_id_and_patient_id"
    t.index ["user_id"], name: "index_conversation_conversations_on_user_id"
  end

  create_table "conversation_messages", force: :cascade do |t|
    t.string "sender_type", null: false
    t.bigint "sender_id", null: false
    t.bigint "conversation_id", null: false
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["conversation_id"], name: "index_conversation_messages_on_conversation_id"
    t.index ["sender_id", "sender_type", "conversation_id"], name: "idx_conversation_message_on_sender_and_conversation"
    t.index ["sender_type", "sender_id"], name: "index_conversation_messages_on_sender_type_and_sender_id"
  end

  create_table "follow_up_campaigns", force: :cascade do |t|
    t.integer "time_frame", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["time_frame"], name: "index_follow_up_campaigns_on_time_frame"
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["phone"], name: "index_patients_on_phone"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "care_requests", "patients"
  add_foreign_key "care_requests", "users"
  add_foreign_key "conversation_conversations", "follow_up_campaigns", column: "follow_up_campaigns_id"
  add_foreign_key "conversation_conversations", "patients"
  add_foreign_key "conversation_conversations", "users"
  add_foreign_key "conversation_messages", "conversation_conversations", column: "conversation_id"
end
