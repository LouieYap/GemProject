class TasksController < ApplicationController
  def index
  end

  def new
   @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.project = Project.find((task_params[:project_id]))
    @task.created_by = current_user

    if @task.save
      flash[:notice] = "Task has been created."
    else
      flash[:danger] = "An error occurred."
    end
    redirect_to dashboard_path
  end

  private
  def task_params
    params.require(:task).permit(:name, :description, :project_id, :category, :status, :priority)
  end

end


