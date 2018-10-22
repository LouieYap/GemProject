class GemMailer < ApplicationMailer

    def send_notification_mail()
        mail(to:'louieY@magenic.com', subject: 'Simple Demo to showcase Active Job')
    end

end
