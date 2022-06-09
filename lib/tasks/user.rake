namespace :user do
  desc "UPDATES ALL USERS"
  task update_all: :environment do
    puts "Updates all users"

    User.all.each do |user|
      puts "Updating user #{user.email}"
      UpdateUserJob.perform_later(user)
    end

  end

  desc "UPDATE ONE USER"
  task :update, [:user_id] => :environment do |t, args|
    user = User.find(args[:user_id])
    puts "Enriching #{user.email}..."
    UpdateUserJob.perform_later(user)
    # rake task will return when job is _done_
  end

end
