class SendNotificationsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts("Sending notifications......")
  end
end
