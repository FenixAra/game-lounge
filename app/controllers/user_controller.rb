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
    totp = ROTP::TOTP.new("base32secret3232")
    otp = totp.now
    email = params[:emailaddress]
    existingOTP = UserOtp.where("email=? AND expires_at > ?", email, Time.now.utc).first
    template = "
        Hi,

        Please verify your email address and activate your account using the below link or OTP("+otp+").
        "
    if !existingOTP
      UserOtp.where(email: email).destroy_all
      UserOtp.create({'email'=> email, 'otp' => otp, 'expires_at' => Time.now.utc+7.days})
      verify_otp_url = ENV['APP_URL']+"/user/verify_otp?email="+ERB::Util.url_encode(email)+"&otp="+otp
      send_mail(params[:emailaddress], "Game Lounge - Verify your email", template+verify_otp_url)
    end
  	redirect_to '/user/enter_otp?email='+ERB::Util.url_encode(email)
  end

  def enter_otp
    @email = params[:email]
    render 'user/enter_otp'
  end

  def verify_otp
    p params
    redirect_to '/'
  end
end
