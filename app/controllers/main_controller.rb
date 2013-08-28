class MainController < ApplicationController

	def register_get
		render :register and return
	end

	def register_post
		@register_title = "Register"
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
				redirect_to "/login"
			end
	end

	def quiz_builder_get
		@categories = Category.order(:name).all
		render :quiz_builder and return
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
		render :clicked and return
	end
end
