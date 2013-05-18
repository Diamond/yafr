require 'feedzirra'

class FeedFetcher
  def initialize(url=nil)
    @url = url
  end

  def fetch
    Feedzirra::Feed.fetch_and_parse(@url)
  end
end
