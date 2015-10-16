class HomeController < ApplicationController

  def index
    @news = News.all
    respond_to do |format|

      format.html # show.html.erb
      format.json { render json: @news }

    end
  end


  def index_2
    url = params[:url][:url]
    @feed = Feedjira::Feed.fetch_and_parse url
    render template: "home/index"
  end


end
