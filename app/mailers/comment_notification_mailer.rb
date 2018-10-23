class CommentNotificationMailer < ApplicationMailer

  def send_notification_mail(x)
    mail(to: x, subject: 'Simple Demo to showcase Active Job')
  end

end
