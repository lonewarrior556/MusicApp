class UsersController < ApplicationController


  def index
    render :index
  end

  def login_page
    render :login_page
  end

  def sign_up
    render :sign_up
  end

  def create_user
    a = User.new(params.require(:user).permit(:email))
    a.password =params[:user][:password]
    a.password_digest=BCrypt::Password.create(params[:user][:password])
    if a.save

      redirect_to users_login_url
    else
      @errors = a.errors.full_messages
      render :sign_up
    end
  end

  def login_user
    user = User.find_by_email(params[:user][:email])
    if user.nil?
      @errors=["This email is available!"]
      render :sign_up
    elsif !BCrypt::Password.new(self.password_digest).is_password?(params[:user][:password])
      @errors=["Email/password combo is incorrect"]
      render :login_page
    else
      #session[:session_token] = user.reset_session_token!
    end
  end

end
