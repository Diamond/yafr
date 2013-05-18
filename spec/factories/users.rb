# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@email.com" }
    password "abc123"
    password_confirmation "abc123"
    feeds do
      5.times.map { FactoryGirl.create(:feed) }
    end
  end
end
