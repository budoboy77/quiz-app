class Questionsquizsetup < ActiveRecord::Base
	belongs_to :question
	belongs_to :quiz_setup
end