class SendNotificationsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts("Sending notifications......")
    GemMailer.send_notification_mail.deliver_now

  end
end
