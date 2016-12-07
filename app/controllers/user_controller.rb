require 'pony'
require 'rotp'

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
    totp = ROTP::TOTP.new("base32secret3232")
    otp = totp.now
    p otp
    template = "
      Hi,

      Please verify your email address and activate your account using the below link or OTP("+otp+").
      "
    verify_otp_url = ENV['APP_URL']+"/user/verify_otp?email="+ERB::Util.url_encode(params[:emailaddress])+"&otp="+otp

    send_mail(params[:emailaddress], "Game Lounge - Verify your email", template+verify_otp_url)
  	redirect_to '/'
  end

  def verify_otp
    p params
    redirect_to '/'
  end
end
