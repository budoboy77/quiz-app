class QuizSetup < ActiveRecord::Base
  has_many :assignments
  has_many :users, through: :assignments
  has_and_belongs_to_many :questions, join_table: "questions_quiz_setups",
  class_name: "Question", foreign_key: "quiz_setup_id",
  association_foreign_key: "question_id"
end