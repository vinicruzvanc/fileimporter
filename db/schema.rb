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

ActiveRecord::Schema[7.0].define(version: 2023_11_21_172345) do
  create_table "authentications", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_role_id"
    t.index ["user_role_id"], name: "index_authentications_on_user_role_id"
  end

  create_table "purchasers", force: :cascade do |t|
    t.string "purchaser_name"
    t.string "item_description"
    t.float "item_price"
    t.integer "purchase_count"
    t.float "total_income"
    t.string "merchant_address"
    t.string "merchant_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "authentication_id"
    t.index ["authentication_id"], name: "index_purchasers_on_authentication_id"
  end

  create_table "user_roles", force: :cascade do |t|
    t.string "role_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
