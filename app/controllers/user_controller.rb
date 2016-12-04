require 'pony'

class UserController < ApplicationController
  include UserHelper
  skip_before_filter  :verify_authenticity_token
  
  def register
  	if session[:user_id]
  	else
  		render 'user/register'
  	end
  end

  def register_email
  	p params
    send_mail(params[:emailaddress], "Hi", "Hello this is new email")
  	redirect_to '/'
  end
end
