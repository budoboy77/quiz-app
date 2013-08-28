class User < ActiveRecord::Base
	has_many :quizzes
	has_secure_password
end