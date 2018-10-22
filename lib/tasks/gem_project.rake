namespace :gem_project do
  desc "Process Notification"
  task :process_notification => :environment do
    SendNotificationsJob.perform_later
  end

end
