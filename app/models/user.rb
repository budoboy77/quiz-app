class User < ActiveRecord::Base
	validates_uniqueness_of :email
	has_many :quizzes
	has_secure_password
end