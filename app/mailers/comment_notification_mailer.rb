class CommentNotificationMailer < ApplicationMailer

  def send_notification_mail()
    mail(to: recipient, subject: 'Simple Demo to showcase Active Job')
  end

end
