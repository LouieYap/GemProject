namespace :test do
  desc "My first task"
  task :first_task => :environment do
    FailJob.perform_later
  end


end
