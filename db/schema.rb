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

ActiveRecord::Schema.define(version: 2020_04_04_105640) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidates", force: :cascade do |t|
    t.bigint "district_id", null: false
    t.bigint "party_id", null: false
    t.integer "gid"
    t.string "name", null: false
    t.string "cname"
    t.string "thumb"
    t.string "picture"
    t.integer "no"
    t.string "gender"
    t.string "birthday"
    t.integer "age"
    t.string "address"
    t.string "job"
    t.text "education"
    t.text "career"
    t.string "property"
    t.string "military"
    t.integer "tax"
    t.integer "tax_unpaid_5yrs"
    t.integer "tax_unpaid_current"
    t.integer "crime"
    t.integer "candidate_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["district_id"], name: "index_candidates_on_district_id"
    t.index ["party_id"], name: "index_candidates_on_party_id"
  end

  create_table "districts", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "province_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["province_id"], name: "index_districts_on_province_id"
  end

  create_table "parties", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "provinces", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "candidates", "districts"
  add_foreign_key "candidates", "parties"
  add_foreign_key "districts", "provinces"
end
