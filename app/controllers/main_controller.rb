class MainController < ApplicationController

    before_filter except: ["root_get", "login_get", "login_post", "logout", "register_get"] do
    if session[:user_id] != nil
      user = User.where(id: session[:user_id]).first
    else
      flash[:error] = "You must be logged in to see that page."
      session[:attempted_path] = request.path_info
      redirect_to "/login" and return
    end
    end
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
		user = User.where(email: params[:email]).first
		if user == nil
			flash.now[:error] = "Login failed.  Invalid user name."
			render :login and return
		end
		if user.authenticate(params[:password]) != false
			session[:user_id] = user.id
			redirect_to "/myquizzes" and return
		else
			flash.now[:error] = "Login failed.  Check your user name and password."
			render :login and return
		end
	end

	def logout
		session.clear
		flash[:error] = "You have logged out."
		redirect_to "/login" and return
	end

	def myquizzes_get
		@title = "My Quizzes"
		@my_quizzes = User.find(session[:user_id]).quiz_setups
		render :my_quizzes and return
	end

	def quiz_get
		@quiz = QuizSetup.find(params[:quiz_id])
		@questions = User.find(session[:user_id]).quiz_setups.find(@quiz.id).questions
		render :quiz and return
	end

	def quiz_post
		@quiz = QuizSetup.find(params[:quiz_id])
		@questions = User.find(session[:user_id]).quiz_setups.find(@quiz.id).questions
		@questions.each do |question|
			quiz_result = QuizResult.new
			quiz_result.quiz_setup_id = @quiz.id
			quiz_result.question_id = params["question#{question.id}"].slice
			quiz_result.answer = params["question#{question.id}"]
		end
		
	end

	def help_get
		@title = "help"
		render :help and return
	end

	def clicked_get
		render :clicked_button and return
	end
end
