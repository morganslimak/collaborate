class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:alert] = "Welcome, #{@user.first_name}!  To get started, please create a new project below, or wait for another user to add you to their project."
      redirect_to @user
    else
      flash.now[:alert] = "Something went wrong!  Please fill in all fields and make sure passswords match."
      render :new
    end
  end

  def show
    @user = current_user
    @projects = @user.projects
    if @user.id != params[:id].to_i
      redirect_to @user
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      flash.now[:alert] = "Something went wrong!  Please fill in all fields and make sure passswords match."
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :password_confirmation)
  end
end
