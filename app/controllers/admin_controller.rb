class AdminController < ApplicationController
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
		edit_question = Question.find(params[:id])
		@category = edit_question.question_category
		@type = edit_question.question_type
		@text = edit_question.question_text
		@choice1 = edit_question.choice1
		@choice2 = edit_question.choice2
		@choice3 = edit_question.choice3
		@choice4 = edit_question.choice4
		@title = "Questions - Edit"
	else
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
	# if params[:commit] == "Search"
	#  	@questions = Question.where("question_text ilike ?", "%#{params[:criteria]}%").all
	#  	@category = ""
	# 	@type = ""
	# 	@text = ""
	# 	@choice1 = ""
	# 	@choice2 = ""
	# 	@choice3 = ""
	# 	@choice4 = ""
	#  	render :questions and return
	# end
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
		question.question_category = params[:new_category]
		category.save!
	else
		question.question_category = params[:category]
	end
	if params[:new_type] != ""
		type = Type.new
		type.name = params[:new_type]
		question.question_type 	= params[:new_type]
		type.save!
	else
		question.question_type 	= params[:type]
	end
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
		edit_category = Category.find(params[:id])
		@name = edit_category.name
		@title = "Categories - Edit"
	else
		@edit_category_name = ""
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

  def types_get
	redirect_to "/admin/types/new" and return
  end

  def types_params_get
	if params[:id] != "new"
		edit_type = Type.find(params[:id])
		@name = edit_type.name
		@title = "Types - Edit"
	else
		@edit_type_name = ""
		@title = "Types"
	end
	@types = Type.order("id desc").all
	render :types and return
  end

  def types_params_post
	if params[:commit] == "Delete Type"
		Type.destroy(params[:id])
		redirect_to "/admin/types/new" and return
	end
	if params[:id] == "new"
		type = Type.new
	else
		type = Type.find(params[:id])
	end
	type.name	= params[:name]
	type.save!
	redirect_to "/admin/types/new" and return
  end

  def quiz_builder_get
	@categories = Category.order(:name).all
	render :quiz_builder and return
  end
end
