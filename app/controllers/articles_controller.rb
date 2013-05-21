class ArticlesController < ApplicationController
  def index
    @feed = Feed.find(params[:feed_id])
    @feed.fetch
  end
end
