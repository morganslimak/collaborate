class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  before_action :already_logged_in?, only: [:new, :create]

  def new
    @user = current_user
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:alert] = "Welcome back, #{@user.first_name}!"
      redirect_to @user
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
