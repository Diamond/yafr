require 'spec_helper'

describe Article do
  context "When creating a new feed" do
    context "With valid data" do
      let (:feed)        { FactoryGirl.create(:feed) }
      subject (:article) { feed.articles.first       }

      it              { should_not be_nil }
      its(:author)    { should_not be_nil }
      its(:body)      { should_not be_nil }
      its(:published) { should_not be_nil }
      its(:read)      { should be_false   }
      its(:title)     { should_not be_nil }
      its(:feed)      { should eq feed    }

      it "is read after marking as read" do
        article.mark_as_read
        expect(article.read).to eq true
      end

      it "is unread after marking as unread" do
        article.mark_as_unread
        expect(article.read).to eq false
      end
    end
  end
end
