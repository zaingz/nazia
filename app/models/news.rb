class News < ActiveRecord::Base
  default_scope {where(approved: true) }




  def self.dump_news
    url_forbes = "http://www.forbes.com/most-popular/feed/"
    url_dawn = "http://feeds.feedburner.com/dawn-news?fmt=xml"
    url_tech_crunch = "http://feeds.feedburner.com/TechCrunch/"
    url_pak_times = "http://feeds.feedburner.com/pakistantimespt?fmt=xml"

    feed_forbs = Feedjira::Feed.fetch_and_parse(url_forbes)
    feed_dawn = Feedjira::Feed.fetch_and_parse(url_dawn)
    feed_tech_crunch = Feedjira::Feed.fetch_and_parse(url_tech_crunch)
    feed_pak_times = Feedjira::Feed.fetch_and_parse(url_pak_times)

    feeds = [feed_forbs,  feed_dawn,  feed_tech_crunch, feed_pak_times]


    feeds.each do |feed|
      source = feed.title
      feed.entries[0...5].each do |news|
        title = news.title
        author = news.author
        published_at = news.published
        content = news.summary.to_s.gsub(/(<img[^>]*\/>)|(<img[^>]*\>(\s)?<\/img>)/ , '')
        image = news.image.gsub(/-150x150/, '')|| "http://www.abgal.com.au/images/above_ground_liner/Dark%20Blue%20.jpg"
        url = news.url
        News.find_or_create_by(title: title, author: author, published_at: published_at,
                    content: content, source: source, image: image, url:url
        )
      end
    end


  end

end
