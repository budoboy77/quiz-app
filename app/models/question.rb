class Question < ActiveRecord::Base
  belongs_to :category
  belongs_to :type
  has_and_belongs_to_many :quiz_setups, join_table: "questions_quiz_setups",
  class_name: "QuizSetup", foreign_key: "question_id",
  association_foreign_key: "quiz_setup_id"
end