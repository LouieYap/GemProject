require 'resque/scheduler/server'

Resque.redis = ENV["REDIS_URL"] || "localhost:6379"
Resque.inline = true unless Rails.env.production?
Resque::Server.use(Rack::Auth::Basic) do |user, password|
  user == ENV["RESQUE_SERVER_USERNAME"] && password == ENV["RESQUE_SERVER_PASSWORD"]
end