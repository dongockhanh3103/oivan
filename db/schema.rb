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

ActiveRecord::Schema.define(version: 2020_12_18_033835) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "quiz_answers", force: :cascade do |t|
    t.bigint "quiz_question_id"
    t.string "content"
    t.boolean "correct"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["quiz_question_id"], name: "index_quiz_answers_on_quiz_question_id"
  end

  create_table "quiz_questions", force: :cascade do |t|
    t.bigint "quiz_id"
    t.string "label"
    t.string "description"
    t.integer "score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["quiz_id"], name: "index_quiz_questions_on_quiz_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.text "description"
    t.integer "score", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_quizzes_on_user_id"
  end

  create_table "refresh_tokens", force: :cascade do |t|
    t.bigint "user_id"
    t.string "crypted_token"
    t.string "token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_refresh_tokens_on_user_id"
  end

  create_table "take_answers", force: :cascade do |t|
    t.bigint "take_quiz_id"
    t.bigint "quiz_question_id"
    t.bigint "quiz_answer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["quiz_answer_id"], name: "index_take_answers_on_quiz_answer_id"
    t.index ["quiz_question_id"], name: "index_take_answers_on_quiz_question_id"
    t.index ["take_quiz_id"], name: "index_take_answers_on_take_quiz_id"
  end

  create_table "take_quizzes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "quiz_id"
    t.datetime "start_at"
    t.datetime "finish_at"
    t.integer "score"
    t.string "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["quiz_id"], name: "index_take_quizzes_on_quiz_id"
    t.index ["user_id"], name: "index_take_quizzes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.integer "role", default: 0
    t.text "refresh_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
