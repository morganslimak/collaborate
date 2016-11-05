class MembersController < ApplicationController
  def create
    user = User.find_by(username: params[:username])
    if user.nil?
      #error
      redirect_to :back
    else
      Member.create(user_id: user.id, project_id: params[:project_id])
      redirect_to :back
    end
  end

end
