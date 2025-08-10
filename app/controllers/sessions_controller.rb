class SessionsController < ApplicationController
  before_action :redirect_if_logged_in, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      cookies.encrypted[:user_id] = user.id
      user.online!
      flash[:success] = "Welcome back, #{user.username}!"
      redirect_to chats_path
    else
      flash.now[:alert] = "Invalid email or password"
      render 'new'
    end
  end

  def destroy
    current_user&.offline!
    session[:user_id] = nil
    cookies.delete(:user_id)
    flash[:success] = "You have been logged out"
    redirect_to login_path
  end
end
