class HomeController < ApplicationController
  def index
    @feeds = current_user.feeds if current_user
  end
end
