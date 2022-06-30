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

ActiveRecord::Schema[7.0].define(version: 2022_06_30_152716) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boolean_data_points", force: :cascade do |t|
    t.boolean "value"
    t.string "name"
    t.integer "sleep_quality_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "integer_data_points", force: :cascade do |t|
    t.integer "value"
    t.string "name"
    t.integer "sleep_quality_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "secrets", force: :cascade do |t|
    t.jsonb "configuration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sleep_qualities", force: :cascade do |t|
    t.date "date"
    t.integer "sleep_rating"
    t.float "sleep_duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_sleep_qualities_on_user_id"
  end

  create_table "time_data_points", force: :cascade do |t|
    t.datetime "value"
    t.string "name"
    t.integer "sleep_quality_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "hashed_pin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username", null: false
  end

  add_foreign_key "boolean_data_points", "sleep_qualities"
  add_foreign_key "sleep_qualities", "users"
end
