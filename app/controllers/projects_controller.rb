class ProjectsController < SecureController
  before_action :set_project, except: [:index, :create, :new]

  def index
  @projects = Project.all
  end

  def new
   @project = Project.new
   authorize! :new, @project
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
  end

  def edit
  end

  def destroy
    @project.destroy
    flash[:notice] = "Project has been deleted."
    redirect_to projects_path
  end

  def update
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

  def set_project
    @project = Project.find(params[:id])
  end

end
