class FakeJob < ApplicationJob
  queue_as :default

  def perform
    puts "I'm starting the fake job...."
    puts "I'm doing something very fake"
    sleep 3
    puts "Ok I'm done now"
  end
end