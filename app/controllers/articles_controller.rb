class ArticlesController < ApplicationController
  require 'open-uri'
  require 'rss'

  before_action :get_feed, :sorted_item_array

  def index
  end

  private
    def get_feed
      url_str = "https://www.discountlandlord.co.uk/news/feed/"
      @feed = RSS::Parser.parse(open(url_str))
    end

    def sorted_item_array
      @result = Array.new
      @feed.items.each do |item|
        @result.push(item)
      end
      #@result.sort_by! { |m| m.pubDate }
      #@result.reverse!
      @result.sort_by { |m| m.pubDate } .reverse!
    end
end
