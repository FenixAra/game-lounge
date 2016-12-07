Rails.application.routes.draw do
  get 'user/register'
  post 'user/register_email'
  get 'user/verify_otp'

  get 'login/index'

  root to: 'login#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
