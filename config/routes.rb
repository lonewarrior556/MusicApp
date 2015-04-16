Rails.application.routes.draw do

  root 'users#index'

  get 'users/login', :to => 'users#login_page'
  get 'users/signup', :to => 'users#sign_up'
  post 'users/signup', :to => 'users#create_user'
  post 'user/login', :to => 'users#login_user'


end
