class DashboardController < SecureController

  def index
    @tasks = Task.order_by_priority.where(assigned_to_id: "#{current_user.id}")

  end
end
