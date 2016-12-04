
class UserController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  def register
  	if session[:user_id]
  	else
  		render 'user/register'
  	end
  end
  def register_email
  	p params
  	redirect_to '/'
  end
end
