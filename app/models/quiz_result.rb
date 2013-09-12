class QuizResult < ActiveRecord::Base
	belongs_to :question
	belongs_to :user
	belongs_to :quiz_setup
end