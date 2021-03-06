class CommentController < SecureController
  before_action :set_comment, except: [:index, :create, :new]

  def index

  end

  def new

  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Comment has been created."
      redirect_to controller:'tasks', action: 'show', id:@comment.task_id
    else
      flash[:danger] = "An error occurred."
      redirect_to controller:'tasks', action: 'show', id:@comment.task_id
    end

  end

  def edit
    @task = Task.find(@comment.task_id)
  end

  def update
    if  @comment.update(comment_params)
      flash[:notice] = "Comment has been updated."
      redirect_to controller:'tasks', action: 'show', id:@comment.task_id
    else
      flash[:danger] = "An error occurred."
      redirect_to controller:'tasks', action: 'show', id:@comment.task_id
    end
  end

  def destroy
    @comment.destroy
    flash[:notice] = "Comment has been deleted."
    redirect_to controller:'tasks', action: 'show', id:@comment.task_id
  end

  def comment_params
    params.require(:comment).permit(:description, :task_id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
