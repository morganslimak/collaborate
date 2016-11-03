class TasksController < ApplicationController
    def create
      @project = Project.find(params[:project_id])
      @task = @project.tasks.new(task_params)

      if @task.save
        redirect_to :back
      else
      end
    end

    private

    def task_params
      params.require(:task).permit(:description, :project_id)
    end
end
