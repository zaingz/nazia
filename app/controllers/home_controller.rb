class HomeController < ApplicationController
  def index
    url = "http://www.forbes.com/most-popular/feed/"
    @feed = Feedjira::Feed.fetch_and_parse url
  end
  def index_2
    url = params[:url][:url]
    @feed = Feedjira::Feed.fetch_and_parse url
    render template: "home/index"
  end

  def general
    url_forbes = "http://www.forbes.com/most-popular/feed/"
    url_dawn = "http://feeds.feedburner.com/dawn-news?fmt=xml"
    url_tech_crunch = "http://feeds.feedburner.com/TechCrunch/"

    feed_forbs = Feedjira::Feed.fetch_and_parse(url_forbes)
    feed_dawn = Feedjira::Feed.fetch_and_parse(url_dawn)
    feed_tech_crunch = Feedjira::Feed.fetch_and_parse(url_tech_crunch)


    @feeds = [feed_forbs,  feed_dawn,  feed_tech_crunch]

  end
end
