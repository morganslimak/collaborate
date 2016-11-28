class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :require_login

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  private

  def require_login
    if current_user == nil
      redirect_to root_path
    end
  end

  def already_logged_in?
    redirect_to current_user unless current_user == nil
  end
end
