class SendNotificationsJob < ApplicationJob
  queue_as :default

  def perform()
    puts("Sending notifications......")
    Notification.where("sent_at is NULL ").each do |n|
      puts "RECIPIENT Hans: " + n.recipient
      CommentNotificationMailer.send_notification_mail(n.recipient).deliver_now
      n.sent_at = DateTime.now
      n.save
    end
  end
end
