class SendNotificationsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts("Sending notifications......")
    Notification.where(:sent_at.nil?).each do |n|
      CommentNotificationMailer.send_notification_mail(n.recipient).deliver_now
      n.sent_at = DateTime.now
      n.update
    end
  end
end
