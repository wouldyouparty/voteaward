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

ActiveRecord::Schema.define(version: 2020_04_07_062607) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "awards", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_awards_on_user_id"
  end

  create_table "awards_candidates", force: :cascade do |t|
    t.bigint "award_id"
    t.bigint "candidate_id"
    t.index ["award_id"], name: "index_awards_candidates_on_award_id"
    t.index ["candidate_id"], name: "index_awards_candidates_on_candidate_id"
  end

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
    t.integer "awards_count", default: 0
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

  create_table "trails", force: :cascade do |t|
    t.text "body"
    t.string "url"
    t.bigint "user_id", null: false
    t.bigint "candidate_id", null: false
    t.boolean "verfied", default: false
    t.integer "likes_count", default: 0
    t.integer "dislikes_count", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["candidate_id"], name: "index_trails_on_candidate_id"
    t.index ["user_id"], name: "index_trails_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "role"
    t.string "name"
    t.string "birth"
    t.boolean "newsletter"
    t.datetime "last_seen_at"
    t.string "provider"
    t.string "uid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.string "votable_type"
    t.bigint "votable_id"
    t.string "voter_type"
    t.bigint "voter_id"
    t.boolean "vote_flag"
    t.string "vote_scope"
    t.integer "vote_weight"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["votable_type", "votable_id"], name: "index_votes_on_votable_type_and_votable_id"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
    t.index ["voter_type", "voter_id"], name: "index_votes_on_voter_type_and_voter_id"
  end

  add_foreign_key "candidates", "districts"
  add_foreign_key "candidates", "parties"
  add_foreign_key "districts", "provinces"
  add_foreign_key "trails", "candidates"
  add_foreign_key "trails", "users"
end
