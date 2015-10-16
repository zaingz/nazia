desc "This task is called by the Heroku scheduler add-on"
task :update_news => :environment do
  puts "Updating feed..."
  News.dump_news
  puts "done."
end

