class TasksController < ApplicationController
  def index
  end

  def new
   @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    #@task.project = Project.find((task_params[:project_id]))
    @task.created_by = current_user
    @task.assigned_to = current_user

    if @task.save
      flash[:notice] = "Task has been created."
    else
      flash[:danger] = "An error occurred."
    end
    redirect_to dashboard_path
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if  @task.update(task_params)
      flash[:notice] = "Task has been updated."
      redirect_to dashboard_path

    else
      flash[:danger] = "An error occurred."
      render "edit"
    end

  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "Task has been deleted."
    redirect_to dashboard_path
  end

  private
  def task_params
    params.require(:task).permit(:name, :description, :project_id, :category, :status, :priority)
  end

end


