
  desc "TODO"
  task :update_news => :environment do
  	News.delete_all("published_at < '#{1.days.ago}'")
    News.dump_news

  end
