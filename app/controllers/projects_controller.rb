class ProjectsController < SecureController
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
  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:notice] = "Project has been deleted."
    redirect_to projects_path
  end

  def update
    @project = Project.find(params[:id])

    if  @project.update(project_params)
      flash[:notice] = "Project has been updated."
      redirect_to projects_path

    else
      flash[:danger] = "An error occurred."
      render "edit"
    end
    end


  private
  def project_params
    params.require(:project).permit(:name, :description)
  end

end
