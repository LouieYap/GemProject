class DashboardController < SecureController

  def index

    @tasks = Task.all


  end
end
