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

ActiveRecord::Schema.define(version: 20170302164613) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reviews", force: :cascade do |t|
    t.integer  "tutor_id"
    t.integer  "student_id"
    t.text     "content"
    t.integer  "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_reviews_on_student_id", using: :btree
    t.index ["tutor_id"], name: "index_reviews_on_tutor_id", using: :btree
  end

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "current_location"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "user_id"
    t.string   "avatar"
    t.index ["user_id"], name: "index_students_on_user_id", using: :btree
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects_tutors", id: false, force: :cascade do |t|
    t.integer "tutor_id"
    t.integer "subject_id"
    t.index ["subject_id"], name: "index_subjects_tutors_on_subject_id", using: :btree
    t.index ["tutor_id"], name: "index_subjects_tutors_on_tutor_id", using: :btree
  end

  create_table "tutors", force: :cascade do |t|
    t.text     "education"
    t.text     "experience"
    t.string   "email"
    t.string   "phone"
    t.string   "hours"
    t.integer  "rate_cents"
    t.string   "current_location"
    t.string   "subjects_taught"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "avatar"
    t.string   "name"
    t.string   "user_id"
    t.integer  "status_code"
    t.index ["user_id"], name: "index_tutors_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "email"
    t.string   "student_or_tutor"
    t.string   "password_digest"
    t.string   "token"
    t.text     "description"
    t.index ["token"], name: "index_users_on_token", unique: true, using: :btree
  end

end
