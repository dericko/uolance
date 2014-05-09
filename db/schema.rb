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

ActiveRecord::Schema.define(version: 20140509161834) do

  create_table "endorsements", force: true do |t|
    t.integer  "skill_id"
    t.integer  "endorser_id"
    t.integer  "endorsee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "endorsements", ["endorsee_id"], name: "index_endorsements_on_endorsee_id"
  add_index "endorsements", ["endorser_id"], name: "index_endorsements_on_endorser_id"
  add_index "endorsements", ["skill_id"], name: "index_endorsements_on_skill_id"

  create_table "posts", force: true do |t|
    t.integer  "user_id"
    t.string   "category"
    t.string   "date"
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "reviews", force: true do |t|
    t.integer  "post_id"
    t.integer  "reviewer_id"
    t.integer  "reviewee_id"
    t.string   "title"
    t.text     "text"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["post_id"], name: "index_reviews_on_post_id"
  add_index "reviews", ["reviewee_id"], name: "index_reviews_on_reviewee_id"
  add_index "reviews", ["reviewer_id"], name: "index_reviews_on_reviewer_id"

  create_table "skills", force: true do |t|
    t.integer  "user_id"
    t.string   "skill"
    t.string   "experience"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "skills", ["user_id"], name: "index_skills_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "year"
    t.string   "phone"
    t.boolean  "is_org"
    t.string   "org_name"
    t.integer  "posts_id"
    t.integer  "reviews_id"
    t.integer  "skills_id"
    t.integer  "endorsements_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
