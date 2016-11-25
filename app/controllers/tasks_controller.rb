class TasksController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.new(task_params)

    if @task.save
      redirect_to :back
    else
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to :back
    else
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      redirect_to :back
    else
    end
  end

  private

  def task_params
    params.require(:task).permit(:description, :project_id, :status)
  end
end
