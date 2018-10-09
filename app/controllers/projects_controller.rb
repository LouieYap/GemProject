class ProjectsController < ApplicationController
  def index
  @projects = Project.all
  end

  def new
   @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:notice] = "Project has been created."
      redirect_to projects_path

    else
      flash[:danger] = "An error occurred."
      render new_project_path

    end
  end




  private
  def project_params
    params.require(:project).permit(:name, :description)
  end

end
