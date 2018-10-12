class DashboardController < SecureController

  def index
    @tasks = Task.order_by_priority

  end
end
