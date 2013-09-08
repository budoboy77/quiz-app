class Question < ActiveRecord::Base
  belongs_to :category
  belongs_to :type
  has_many :questionsquizsetups
  has_many :quiz_setups, through: :questionsquizsetups
end