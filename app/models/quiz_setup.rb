class QuizSetup < ActiveRecord::Base
  has_many :assignments
  has_many :users, through: :assignments
  has_many :questionsquizsetups
  has_many :questions, through: :questionsquizsetups
  has_many :quiz_results
end