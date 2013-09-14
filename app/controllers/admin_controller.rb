class AdminController < ApplicationController

  before_filter except: ["login_get", "login_post", "logout"] do
    if session[:admin_id] != nil
      @admin = Admin.where(id: session[:admin_id]).first
    else
      flash[:error] = "You must be logged in to see that page."
      session[:attempted_path] = request.path_info
      redirect_to "/admin/login" and return
    end
  end

  def login_get
    render :login and return
  end

  def login_post
    username = params[:username]
    password = params[:password]
    admin    = Admin.where(username: username).first

    if admin == nil
      flash.now[:error] = "Unknown username"
      render :login and return
    elsif admin.authenticate(password) == false
      flash.now[:error] = "Wrong password"
      render :login and return
    else 
      session[:admin_id] = admin.id

      attempted_path = session[:attempted_path]
      if attempted_path != nil
        session[:attempted_path] = nil
        redirect_to attempted_path and return
      else
        redirect_to "/admin" and return
      end
    end
  end

  def logout
    session.clear
    redirect_to "/admin/login" and return
  end

  def admin_get
	@title = "Admin"
	render :admin and return
  end

  def questions_get
  	@title = "Questions"
	redirect_to "/admin/questions/new" and return
  end

  def questions_params_get
	if params[:id] != "new"
		@edit_question = Question.find(params[:id])
		@edit_question_id = @edit_question.id
		@category = @edit_question.category.name
		@type = @edit_question.type.name
		@text = @edit_question.question_text
		@choice1 = @edit_question.choice1
		@choice2 = @edit_question.choice2
		@choice3 = @edit_question.choice3
		@choice4 = @edit_question.choice4
		if @choice1 == @edit_question.correct_answer
			@answer1 = true
		elsif @choice2 == @edit_question.correct_answer
			@answer2 = true
		elsif @choice3 == @edit_question.correct_answer
			@answer3 = true
		elsif @choice4 == @edit_question.correct_answer
			@answer4 = true
		end
		@title = "Questions - Edit"
	else
		@edit_question_id = "new"
		@category = ""
		@type = ""
		@text = ""
		@choice1 = ""
		@choice2 = ""
		@choice3 = ""
		@choice4 = ""
		@title = "Questions"
	end
	@questions = Question.order("id desc").all
	@types = Type.order(:name).all
	@categories = Category.order(:name).all
	render :questions and return
  end

  def questions_params_post
	if params[:commit] == "Delete question"
		Question.destroy(params[:id])
		redirect_to "/admin/questions/new" and return
	end
	if params[:id] == "new"
		question = Question.new
	else
		question = Question.find(params[:id])
	end
	if params[:new_category] != ""
		category = Category.new
		category.name = params[:new_category]
		category.save!
		question.category_id = Category.where(name: params[:new_category]).first.id
	else
		question.category_id = Category.where(name: params[:category]).first.id
	end
	question.type_id = Type.where(name: params[:type]).first.id
	question.question_text 	= params[:text]
	question.choice1		= params[:choice1]
	question.choice2		= params[:choice2]
	question.choice3		= params[:choice3]
	question.choice4		= params[:choice4]
	if params[:answer1] != nil
		question.correct_answer	= params[:choice1]
	elsif params[:answer2] != nil
		question.correct_answer	= params[:choice2]
	elsif params[:answer3] != nil
		question.correct_answer	= params[:choice3]
	else params[:answer4] != nil
		question.correct_answer	= params[:choice4]
	end
	question.save!
	redirect_to "/admin/questions/new" and return
  end

  def categories_get
	redirect_to "/admin/categories/new" and return
  end

  def categories_params_get
	if params[:id] != "new"
		@edit_category = Category.find(params[:id])
		@edit_category_id = @edit_category.id
		@name = @edit_category.name
		@title = "Categories - Edit"
	else
		@edit_category_id = "new"
		@title = "Categories"
	end
	@categories = Category.order("id desc").all
	render :categories and return
  end

  def categories_params_post
	if params[:commit] == "Delete Category"
		Category.destroy(params[:id])
		redirect_to "/admin/categories/new" and return
	end
	if params[:id] == "new"
		category = Category.new
	else
		category = Category.find(params[:id])
	end
	category.name		= params[:name]
	category.save!

	redirect_to "/admin/categories/new" and return
  end

 #  def types_get
	# redirect_to "/admin/types/new" and return
 #  end

 #  def types_params_get
	# if params[:id] != "new"
	# 	@edit_type = Type.find(params[:id])
	# 	@edit_type_id = @edit_type.id
	# 	@name = @edit_type.name
	# 	@title = "Types - Edit"
	# else
	# 	@edit_type_id = "new"
	# 	@title = "Types"
	# end
	# @types = Type.order("id desc").all
	# render :types and return
 #  end

 #  def types_params_post
	# if params[:commit] == "Delete Type"
	# 	Type.destroy(params[:id])
	# 	redirect_to "/admin/types/new" and return
	# end
	# if params[:id] == "new"
	# 	type = Type.new
	# else
	# 	type = Type.find(params[:id])
	# end
	# type.name	= params[:name]
	# type.save!
	# redirect_to "/admin/types/new" and return
 #  end

  def quiz_builder_get
	redirect_to "/admin/quiz-builder/new" and return
  end

  def quiz_builder_params_get
	@categories = Category.order(:name).all
	if params[:id] != "new"
		@edit_quiz_setup = QuizSetup.find(params[:id])
		@edit_quiz_setup_id = @edit_quiz_setup.id
		@edit_quiz_setup_name = @edit_quiz_setup.name
		@title = "Quiz Builder - Edit"
		categories_array = []
        QuizSetup.find(params[:id]).questions.each do |question|
          categories_array << question.category.name
        end
        @categories_hash = categories_array.inject(Hash.new(0)) { |total, e| total[e] += 1 ;total}
        @users_array = []
        QuizSetup.find(params[:id]).users.each do |user|
          @users_array << user.id
        end
        else
		@edit_quiz_setup_id = "new"
		@edit_quiz_setup_name = ""
		@categories_hash = {}
		@title = "Quiz Builder"
		@users_array = []
	end
	@quiz_setups = QuizSetup.order("id desc").all
	render :quiz_builder and return
  end

  def quiz_builder_params_post
  	if params[:commit] == "Delete quiz"
		QuizSetup.destroy(params[:id])
		redirect_to "/admin/quiz-builder/new" and return
	end
	if params[:id] == "new"
		quiz_setup = QuizSetup.new
	else
		QuizSetup.find(params[:id]).questionsquizsetups.delete_all
		QuizSetup.find(params[:id]).assignments.delete_all
		quiz_setup = QuizSetup.find(params[:id])
	end
	quiz_setup.name	= params[:quiz_name]
	quiz_setup.save!
	@edit_quiz_setup = QuizSetup.where(name: quiz_setup.name).first
	question_array = []
	Category.all.each do |category|
	  category1 = Category.where(name: params["category#{category.id}"]).first
      if category1 != nil
		  Question.where(category_id: category1.id).limit(params["qty#{category.id}"]).order("RANDOM()").each do |question|
		    question_array << question.id
	  	  end
	  end
	end
	question_array.each do |question_element|
		new_questions_to_quiz_link = Questionsquizsetup.new
		new_questions_to_quiz_link.quiz_setup_id = @edit_quiz_setup.id
		new_questions_to_quiz_link.question_id   = question_element
		new_questions_to_quiz_link.save!
	end
	assigned_user_array = []
	User.all.each do |user|
	  if params["user#{user.id}"] == "on"
	  	assigned_user_array << user.id
	  end
	end
	assigned_user_array.each do |assignment|
		new_assignment = Assignment.new
		new_assignment.quiz_setup_id = @edit_quiz_setup.id
		new_assignment.user_id   = assignment
		new_assignment.save!
	end
	redirect_to "/admin/quiz-builder/new" and return
  end
end
