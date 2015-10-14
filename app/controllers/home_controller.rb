class HomeController < ApplicationController
  def index
    url = "http://www.forbes.com/real-time/feed2/"
    @feed = Feedjira::Feed.fetch_and_parse url
  end
  def index_2
    url = params[:url][:url]
    @feed = Feedjira::Feed.fetch_and_parse url
    render template: "home/index"
  end
end
