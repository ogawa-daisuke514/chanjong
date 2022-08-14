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

ActiveRecord::Schema.define(version: 2022_08_06_172545) do

  create_table "conditions", force: :cascade do |t|
    t.integer "arg"
    t.integer "condition_id"
    t.integer "process_type_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "exposed_pieces", force: :cascade do |t|
    t.integer "goal_example_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "exposed_tiles", force: :cascade do |t|
    t.integer "tile_definition_id"
    t.integer "exposed_piece_id"
    t.boolean "robbed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "friends", force: :cascade do |t|
    t.integer "request_user_id"
    t.integer "target_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "goal_definitions", force: :cascade do |t|
    t.integer "role_id"
    t.string "name"
    t.integer "fu"
    t.integer "point"
    t.integer "condition_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "goal_examples", force: :cascade do |t|
    t.integer "tile_definition_id"
    t.integer "goal_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hand_tiles", force: :cascade do |t|
    t.integer "goal_example_id"
    t.integer "tile_definition_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "piece_definitions", force: :cascade do |t|
    t.string "name"
    t.boolean "natural"
    t.integer "piece_definition_id"
    t.integer "role_id"
    t.integer "condition_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "role_orders", force: :cascade do |t|
    t.integer "higher_role_id"
    t.integer "lower_role_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "roles", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "kana"
    t.integer "faan"
    t.integer "score_down_type"
    t.string "outline"
    t.string "comment"
    t.integer "goal_definition_id"
    t.integer "condition_id"
    t.integer "goal_example_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
