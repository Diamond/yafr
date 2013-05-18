# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :feed do
    sequence(:title) { |n| "Feed #{n}" }
    sequence(:url) { |n| "http://feed.com/url/#{n}/rss" }
    articles do
      5.times.map { FactoryGirl.create(:article) }
    end
    user_id 1
  end
end
