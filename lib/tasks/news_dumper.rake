
  desc "TODO"
  task :update_news => :environment do
    News.dump_news
  end
