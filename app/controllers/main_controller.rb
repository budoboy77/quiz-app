class MainController < ApplicationController

    before_filter except: ["root_get", "login_get", "login_post", "logout", "register_get", "register_post"] do
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

	def quiz_detail_params_get
		@quiz_results = QuizResult.where(quiz_setup_id: params[:quiz_id]).where(user_id: session[:user_id])
		@quizzes = QuizSetup.all
		@questions = QuizSetup.find(params[:quiz_id]).questions
		@title = "Results for #{@quizzes.where(id: params[:quiz_id]).first.name}"
		render :quiz_detail and return
	end

	def quiz_get
		@title = "Quiz"
		@user = User.find(session[:user_id])
		@quiz = QuizSetup.where(id: params[:quiz_id]).first
		if @quiz == nil
			redirect_to "/myquizzes" and return
		end
		@quiz_setup = @user.assignments.where(quiz_setup_id: @quiz.id).first
		if @quiz_setup == nil
			redirect_to "/myquizzes" and return
		end
		@questions = QuizSetup.find(@quiz.id).questions
		@quiz_results = QuizResult.where(quiz_setup_id: @quiz.id).where(user_id: session[:user_id])
		if User.find(session[:user_id]).assignments.where(quiz_setup_id: @quiz.id).first.score != nil
			redirect_to "/myquizzes" and return
		end
		@unanswered_questions = []
		@questions.each do |question|
			if @quiz_results.where(question_id: question.id).first == nil
				@unanswered_questions << question.id
			end
		end
		session[:unanswered_questions] = @unanswered_questions[0..3]
		render :quiz and return
	end

	def quiz_post
		@quiz = QuizSetup.find(params[:quiz_id])
		@questions = QuizSetup.find(@quiz.id).questions
		@quiz_results = QuizResult.where(quiz_setup_id: @quiz.id).where(user_id: session[:user_id])
		session[:unanswered_questions].each do |question_id|
			if params["question#{question_id}"] == nil
				flash.now[:error] = "Please answer all the questions."
				render :quiz and return
			else
				quiz_result = QuizResult.new
				quiz_result.quiz_setup_id = @quiz.id
				quiz_result.question_id = question_id
				quiz_result.user_answer = params["question#{question_id}"]
				if quiz_result.user_answer == @questions.find(question_id).correct_answer
					quiz_result.is_correct = true
				else
					quiz_result.is_correct = false
				end
				quiz_result.user_id = session[:user_id]
				quiz_result.save!
			end
		end
		if params[:commit] == "Finish"
		  @calculate_score = @quiz_results.where(is_correct: true).count.to_f / @questions.count.to_f
		  @score = sprintf( "%0.f", @calculate_score * 100)
		  save_score = User.find(session[:user_id]).assignments.where(quiz_setup_id: @quiz.id).first
		  save_score.score = @score.to_i
		  save_score.save!
		  flash[:success] = "Thank you for completing the quiz.  You scored #{@score}%."
		  redirect_to "/myquizzes" and return
		end
		redirect_to "/quiz/#{@quiz.id}" and return
	end

	def help_get
		@title = "Help"
		render :help and return
	end

	def clicked_get
		render :clicked_button and return
	end
end
