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

ActiveRecord::Schema.define(version: 20150323044135) do

  create_table "achievements", force: :cascade do |t|
    t.string "type"
    t.string "name"
    t.text "description"
    t.integer "user_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "exercises", force: :cascade do |t|
    t.string   "name"
    t.integer  "increase_per_session"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "user_id"
    t.boolean  "is_public"
  end

  add_index "exercises", ["user_id"], name: "index_exercises_on_user_id"

  create_table "personal_records", force: :cascade do |t|
    t.integer  "resistance"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "exercise_id"
  end

  add_index "personal_records", ["exercise_id"], name: "index_personal_records_on_exercise_id"

  create_table "routines", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "user_id"
    t.boolean  "is_public",  default: false
  end

  add_index "routines", ["user_id"], name: "index_routines_on_user_id"

  create_table "set_groups", force: :cascade do |t|
    t.integer  "number_of_sets"
    t.integer  "reps_per_set"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "exercise_id"
    t.integer  "routine_id"
  end

  add_index "set_groups", ["exercise_id"], name: "index_set_groups_on_exercise_id"
  add_index "set_groups", ["routine_id"], name: "index_set_groups_on_routine_id"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "workout_sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.string   "name"
  end

  create_table "workout_set_groups", force: :cascade do |t|
    t.integer  "resistance",         default: 45
    t.integer  "number_of_sets"
    t.integer  "reps_per_set"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "exercise_id"
    t.integer  "workout_session_id"
  end

  add_index "workout_set_groups", ["exercise_id"], name: "index_workout_set_groups_on_exercise_id"
  add_index "workout_set_groups", ["workout_session_id"], name: "index_workout_set_groups_on_workout_session_id"

  create_table "workout_sets", force: :cascade do |t|
    t.integer  "resistance"
    t.integer  "amount_of_reps"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "exercise_id"
    t.integer  "workout_session_id"
    t.boolean  "is_complete",        default: false
  end

end
