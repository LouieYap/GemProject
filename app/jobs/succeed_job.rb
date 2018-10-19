class SucceedJob < ApplicationJob
  queue_as :default

  def perform(*args)
   sleep(1.minutes)

  end
end
