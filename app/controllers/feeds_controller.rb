class FeedsController < ApplicationController
  def new
    @feed = Feed.new
  end

  def create
    feed = Feed.new(params[:feed])
    feed.user_id = current_user.id
    if feed.valid?
      feed.save
      redirect_to :root, notice: "Feed added succesfully!"
    else
      redirect_to :back, alert: "Unable to add feed!"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
  end

  def show
  end
end
