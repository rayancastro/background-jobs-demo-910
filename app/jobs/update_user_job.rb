class UpdateUserJob < ApplicationJob
  queue_as :critical

  def perform(user)
    puts "Calling clearbit API for #{user.email}"
    sleep 2

    puts "Updating user with enriched information"
    sleep 1
    puts "Done! Enriched #{user.email} with Clearbit"
  end

end
