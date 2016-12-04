class LoginController < ApplicationController
  def index
  	if session[:user_id]
  	else
  		render 'login/index'
  	end
  end
end
