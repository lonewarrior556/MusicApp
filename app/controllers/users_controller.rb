class UsersController < ApplicationController
  before_action :redirect_loggedin, only:[:login_page, :sign_up]

  #implied  [:index, :login_page, :sign_up].map{|x| define_method(x){}}

  def create_user
    a = User.new(params.require(:user).permit(:email))
    a.password_digest=BCrypt::Password.create(params[:user][:password])
    if a.save
      a.update_session_token!(logon)
      redirect_to root_url
    else
      @errors = a.errors.full_messages
      render :sign_up
    end
  end

  def login_user
    user = User.find_by_email(params[:user][:email])
    if user.nil?
      @errors=["This email is available!"]
      render :login_page
    elsif !BCrypt::Password.new(user.password_digest).is_password?(params[:user][:password])
      @errors=["Email/password combo is incorrect"]
      render :login_page
    else
      user.update_session_token!(logon)
      redirect_to root_url
    end
  end

  def logout
    session[:session_token] = nil
    redirect_to root_url
  end


  private
  def logon
    token = User.new_session_token
    session[:session_token] = token
    token
  end


end
