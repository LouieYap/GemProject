class TestJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "starting TestJob"
    sleep(10.seconds)
    puts "completed TestJob"
  end
end
