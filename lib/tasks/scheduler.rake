desc "This task is called by the Heroku scheduler add-on"
task :expired_test => :environment do
  puts "expired test"
  puts "it works."
end

task :expired => :environment do

    for i in 1..Food.ids.max do
        pus i
    end
end