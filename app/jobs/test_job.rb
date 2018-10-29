class TestJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "starting TestJob"
    sleep(1.minutes)
    puts "completed TestJob"
  end
end
