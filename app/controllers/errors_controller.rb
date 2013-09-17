class ErrorsController < ApplicationController
  def routing
  	flash[:error] = "The page you are trying to access does not exist."
  	if session[:admin_id] != nil
    	redirect_to "/admin" and return
    else
    	redirect_to "/myquizzes" and return
    end
  end
end