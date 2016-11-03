class ProjectsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @project = @user.projects.new
  end

  def create
    @user = User.find(params[:user_id])
    @project = @user.projects.new(project_params)

    if @project.save
      redirect_to @project
    else
    end
  end

  def show
    @project = Project.find(params[:id])
    @task = Task.new
    @tasks = @project.tasks
  end

  private

  def project_params
    params.require(:project).permit(:name, :user_id)
  end
end
