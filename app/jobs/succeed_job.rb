class SucceedJob < ApplicationJob
  queue_as :default

  def perform(*args)
   sleep(20.seconds)

  end
end
