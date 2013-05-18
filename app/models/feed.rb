class Feed < ActiveRecord::Base
  attr_accessible :title, :url, :user_id

  belongs_to :user
  has_many :articles

  delegate :unread, to: :articles

  def mark_all_read
    self.articles.update_all({read: true}, {read: false})
  end

  def mark_all_unread
    self.articles.update_all({read: false}, {read: true})
  end

  def fetch
    ff = FeedFetcher.new(self.url)
    new_feed = ff.fetch
    self.title = new_feed.title

    new_feed.sanitize_entries!
    new_feed.entries.each do |entry|
      self.articles << Article.new(author: entry.author, body: entry.content, published: entry.published, read: false, title: entry.title) 
    end
  end
end
