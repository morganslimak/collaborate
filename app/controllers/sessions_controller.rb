class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  
  def new

  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
