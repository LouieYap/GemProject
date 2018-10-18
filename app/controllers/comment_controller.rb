class CommentController < SecureController
  def index

  end
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user

    if @comment.save
      flash[:notice] = "Comment has been created."
      redirect_to controller:'tasks', action: 'show', id:@comment.task_id
    else
      flash[:danger] = "An error occurred."
      redirect_to controller:'tasks', action: 'show', id:@comment.task_id
    end

  end
  def update

  end

  def comment_params
    params.require(:comment).permit(:description, :task_id)
  end
end
