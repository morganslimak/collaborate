class ProjectsController < ApplicationController
  before_action :is_project_member?, only: [:show]

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
    @tasks = @project.tasks.order(:created_at)
    @members = @project.users
    @user = current_user
    @histories = @project.histories.order(:created_at).reverse
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
