class ProjectsController < ApplicationController
  before_action :is_project_member?, only: [:show]

  def new
    @user = User.find(params[:user_id])
    @project = @user.projects.new
  end

  def create
    @user = User.find(params[:user_id])
    @project = @user.projects.new(project_params)
    if @project.save
      @user.projects << @project
      redirect_to @project
    else
    end
  end

  def show
    @project = Project.find(params[:id])
    @task = Task.new
    @member = Member.new
    @tasks = @project.tasks
    @members = @project.users
  end

  private

  def project_params
    params.require(:project).permit(:name, :user_id, :members)
  end

  def is_project_member?
    project = Project.find(params[:id])
    members = project.users.map {|user| user.username}
    redirect_to :back unless members.include?(current_user.username)
  end
end
