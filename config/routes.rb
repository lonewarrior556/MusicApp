Rails.application.routes.draw do

  root 'users#index'

  get 'users/signup', :to => 'users#sign_up'
  post 'users/signup', :to => 'users#create_user'
  get 'users/login', :to => 'users#login_page'
  post 'users/login', :to => 'users#login_user'
  delete 'users/login', :to => 'users#logout'


  resources :bands, only: [ :index, :show ] do
    resources :albums, only: [:show, :create, :new]
  end


  get 'band/add', :to => 'bands#add_page'
  post 'band/add', :to => 'bands#add_band'


end
