class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
    end
  end

  def show
    @user = current_user
    if @user.id != params[:id].to_i
      redirect_to @user
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :password_confirmation)
  end
end
