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

ActiveRecord::Schema.define(version: 2021_07_15_011846) do

  create_table "deputies", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.string "state"
    t.integer "party_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["party_id"], name: "index_deputies_on_party_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.decimal "net_value", precision: 10, scale: 2
    t.date "emission_date"
    t.string "description"
    t.integer "provider_id", null: false
    t.integer "deputy_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deputy_id"], name: "index_expenses_on_deputy_id"
    t.index ["provider_id"], name: "index_expenses_on_provider_id"
  end

  create_table "parties", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "providers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "deputies", "parties"
  add_foreign_key "expenses", "deputies"
  add_foreign_key "expenses", "providers"
end
