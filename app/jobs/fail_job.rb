class FailJob < ApplicationJob
  queue_as :default

  def perform(*args)
   raise 'louie'
  end
end
