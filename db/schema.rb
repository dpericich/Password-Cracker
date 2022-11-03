# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_11_03_031723) do
  create_table "dictionaries", force: :cascade do |t|
    t.string "terms", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_logs", force: :cascade do |t|
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "service_id"
    t.index ["service_id"], name: "index_event_logs_on_service_id"
    t.index ["user_id"], name: "index_event_logs_on_user_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "service_name"
    t.string "base_url"
    t.integer "attempts_before_account_freeze"
    t.integer "attempts_before_backoff"
    t.integer "duration_of_backoff"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rate_limit_per_hour"
    t.string "blocked_ip_origins"
    t.integer "failed_attempts_per_hour"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "status"
    t.integer "current_dictionary_index", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "service_id"
    t.integer "dictionary_id"
    t.index ["dictionary_id"], name: "index_users_on_dictionary_id"
    t.index ["service_id"], name: "index_users_on_service_id"
  end

end
