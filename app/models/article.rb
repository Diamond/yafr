class Article < ActiveRecord::Base
  attr_accessible :author, :body, :feed_id, :published, :read, :title

  belongs_to :feed

  scope :unread, -> { where(read: false) }

  def mark_as_read
    self.read = true
  end

  def mark_as_unread
    self.read = false
  end
end
