class TasksController < ApplicationController
  before_action :set_task, except: [:index, :create, :new]

  def index
     @tasks = Task.order_by_priority
  end

  def new
   @task = Task.new
  end

  def create
    @task = Task.new(task_params) #question: project_id is an integer how come @task.project is properly set by this?
    #@task.project = Project.find((task_params[:project_id]))
    @task.created_by = current_user
    @task.assigned_to = current_user

    if @task.save!
      flash[:notice] = "Task has been created."
    else
      flash[:danger] = "An error occurred."
    end
    redirect_to dashboard_path
  end

  def show
  end

  def edit
    unless @task.assigned_to_id == current_user.id || current_user.admin
      flash[:danger] = "Cannot edit this task."
      redirect_to dashboard_path
    end


  end

  def update
    if  @task.update(task_params)
      flash[:notice] = "Task has been updated."
      redirect_to dashboard_path

    else
      flash[:danger] = "An error occurred."
      render "edit"
    end

  end

  def destroy
    unless @task.assigned_to_id == current_user.id || current_user.admin
      flash[:danger] = "Cannot delete this task."
      redirect_to dashboard_path
    end
    @task.destroy
    flash[:notice] = "Task has been deleted."
    redirect_to dashboard_path
  end

  private
  def task_params
    params.require(:task).permit(:name, :description, :project_id, :assigned_to_id, :due_date, :category, :status, :priority)
  end

  def set_task
    @task = Task.find(params[:id])
  end

end


