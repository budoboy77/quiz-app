class ErrorsController < ApplicationController
  def routing
    redirect_to "/admin/users/index" and return
  end
end