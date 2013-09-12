class User < ActiveRecord::Base
	validates_uniqueness_of :email
	has_many :assignments
	has_many :quiz_setups, through: :assignments
	has_many :quiz_results
	has_secure_password
end