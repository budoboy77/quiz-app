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

ActiveRecord::Schema.define(version: 20130916224830) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: true do |t|
    t.string "username"
    t.string "password_digest"
  end

  create_table "assignments", force: true do |t|
    t.integer "user_id"
    t.integer "quiz_setup_id"
    t.integer "score"
    t.boolean "is_assigned",   default: false
  end

  create_table "categories", force: true do |t|
    t.string "name"
  end

  create_table "questions", force: true do |t|
    t.integer "category_id"
    t.integer "type_id"
    t.text    "question_text"
    t.string  "choice1"
    t.string  "choice2"
    t.string  "choice3"
    t.string  "choice4"
    t.string  "correct_answer"
  end

  create_table "questionsquizsetups", force: true do |t|
    t.integer "question_id"
    t.integer "quiz_setup_id"
  end

  create_table "quiz_results", force: true do |t|
    t.integer "quiz_setup_id"
    t.integer "question_id"
    t.integer "user_id"
    t.string  "user_answer"
    t.boolean "is_correct"
  end

  create_table "quiz_setups", force: true do |t|
    t.string "name"
  end

  create_table "types", force: true do |t|
    t.string "name"
  end

  create_table "users", force: true do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
  end

end
