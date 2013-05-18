# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article do
    sequence(:title) { |n| "Article #{n}" }
    author "Jim Raynor"
    body "This is an article with some text."
    published "2013-05-16 09:19:36"
    read false
    feed_id 1
  end
end
