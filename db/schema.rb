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

ActiveRecord::Schema.define(version: 20130828211151) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string "name"
  end

  create_table "questions", force: true do |t|
    t.string "question_category"
    t.string "question_type"
    t.text   "question_text"
    t.string "choice1"
    t.string "choice2"
    t.string "choice3"
    t.string "choice4"
    t.string "correct_answer"
  end

  create_table "quiz_setups", force: true do |t|
    t.string  "name"
    t.integer "quantity1"
    t.integer "quantity2"
    t.integer "quantity3"
    t.integer "quantity4"
    t.string  "category1"
    t.string  "category2"
    t.string  "category3"
    t.string  "category4"
  end

  create_table "quizzes", force: true do |t|
    t.integer "user_id"
    t.integer "quiz_setup_id"
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
