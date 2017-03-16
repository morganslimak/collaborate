class TasksController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.new(task_params)
    if @task.save
      @project.histories.create(history: current_user.username + " added the task '" + @task.description + "'")
      redirect_to :back
    else
      flash[:alert] = "Task description cannot be blank!"
      redirect_to :back
    end
  end

  def update
    @task = Task.find(params[:id])
    @project = @task.project
    if @task.update(task_params)
      if !task_params[:status].nil? && task_params[:status].include?("Progress")
        @project.histories.create(history: current_user.username + " started working on the task '" + @task.description + "'")
      elsif !task_params[:status].nil? && task_params[:status].include?("Completed")
        @project.histories.create(history: current_user.username + " completed the task '" + @task.description + "'")
      end
      redirect_to :back
    else
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @project = @task.project
    if @task.destroy
      @project.histories.create(history: current_user.username + " deleted the task '" + @task.description + "'")
      redirect_to :back
    else
    end
  end

  private

  def task_params
    params.require(:task).permit(:description, :project_id, :status)
  end
end
