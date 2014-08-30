class ArticlesController < ApplicationController
  require 'open-uri'
  require 'rss'
  #require 'rexml/document'
  #include REXML

  before_action :get_feed

  def index
  end

  private
    def get_feed
      url_str = "https://www.discountlandlord.co.uk/news/feed/"
      feed = RSS::Parser.parse(open(url_str))

      @result = feed
    end
end
