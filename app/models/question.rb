class Question < ActiveRecord::Base
  has_and_belongs_to_many :quiz_setups, join_table: "questions_quiz_setups",
  class_name: "QuizSetup", foreign_key: "question_id",
  association_foreign_key: "quiz_setup_id"
end