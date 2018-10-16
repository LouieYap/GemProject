class DashboardController < SecureController

  def index
    @tasks = Task.order_by_priority.where(assigned_to_id: "#{current_user.id}")

    if @tasks.size == 0
      flash.now[:notice]=  "No task currently assigned to me"
    end
  end
end
