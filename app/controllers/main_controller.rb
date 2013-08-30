class MainController < ApplicationController

	def root_get
		redirect_to "/login" and return
	end

	def register_get
		@title = "Register"
		render :register and return
	end

	def register_post
		@title = "Register"
		user = User.new
		user.first_name = params[:first_name]
		user.last_name = params[:last_name]
		user.email = params[:email]
		user.password = params[:password]
		user.password_confirmation = params[:password_confirmation]
			if user.password != user.password_confirmation
				flash.now[:error] = "Passwords do not match."
				render :register and return
			else
				user.save!
				redirect_to "/login" and return
			end
	end

	def login_get
		@title = "Login"
		render :login and return
	end

	def login_post
		@title = "Login"
		if User.where(email: params[:email]).first == nil
			flash.now[:error] = "Login failed.  Invalid user name."
			render :login and return
		end
		if User.where(email: params[:email]).first.authenticate(params[:password]) != false
			redirect_to "/quiz" and return
		else
			flash.now[:error] = "Login failed.  Check your user name and password."
			render :login and return
		end
	end

	def quiz_get
		@title = "quiz"
		render :quiz and return
	end

	def help_get
		@title = "help"
		render :help and return
	end

	def clicked_get
		render :clicked_button and return
	end
end
