class ArticlesController < ApplicationController
  def index
    @feed = Feed.find(params[:feed_id])
    @feed.fetch
    render :layout => false
  end
end
