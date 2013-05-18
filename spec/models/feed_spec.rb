require 'spec_helper'

describe Feed do
  describe "When creating a new feed" do
    context "With valid data" do
      subject { FactoryGirl.build(:feed, title: "Sample Feed", url: "http://feed.com/") }

      it { should_not be_nil }
      its(:title) { should eq "Sample Feed" }
      its(:url)   { should eq "http://feed.com/" }
      it { should have(5).articles }
    end
  end

  describe "With an existing feed" do
    context "when settings all articles to read" do
      subject (:feed) { FactoryGirl.create(:feed) }

      it "starts with unread articles" do
        expect(feed.unread.size).to be > 0
      end

      it "marks all as read" do
        feed.mark_all_read
        expect(feed.unread.size).to eq 0
      end
    end
  end

  describe "With a new real feed" do
    context "With a sample RSS feed" do
      before :all do
        @feed = FactoryGirl.create(:feed, title: "Sample Feed", url: "http://feeds.feedburner.com/PaulDixExplainsNothing", articles: [])
        VCR.use_cassette("feed") do
          @feed.fetch
        end
      end

      subject (:feed) { @feed }

      it { should_not be_nil }

      it "fetches the feed successfully" do
        expect(feed).to_not be_nil
      end

      it "fetches the feed title" do
        expect(feed.title).to match /Paul Dix Explains Nothing/i
      end

      it "fetches new articles" do
        expect(feed.articles.size).to be > 0
      end

      it "starts with all unread articles" do
        expect(feed.unread.size).to eq feed.articles.size
      end

      it "has zero unread after marking all as read" do
        feed.mark_all_read
        expect(feed.unread.size).to eq 0
      end

      it "has all unread after marking all as unread" do
        feed.mark_all_unread
        expect(feed.unread.size).to eq feed.articles.size
      end
    end
  end
end
