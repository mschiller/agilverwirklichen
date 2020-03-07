class FeedsController < ApplicationController
  respond_to :atom

  def news
    @news = News.published.order('news.start_datetime DESC').all
    @news = [News.last] if @news.empty?
  end

  def archive
    @news = News.order('news.start_datetime ASC').all
  end
end
