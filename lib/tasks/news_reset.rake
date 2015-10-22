
  desc "TODO"
  task :news_reset => :environment do
  	News.destroy_all
  end

