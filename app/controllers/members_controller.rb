class MembersController < ApplicationController
  def create
    user = User.find_by(username: params[:username])
    project = Project.find(params[:project_id])
    if user.nil? || project.users.include?(user)
      #error
      redirect_to :back
    else
      Member.create(user_id: user.id, project_id: project.id)
      redirect_to :back
    end
  end

end
