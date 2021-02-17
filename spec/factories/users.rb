FactoryBot.define do
  factory :user do |u|
    u.sequence(:username) {|n| "user-#{n}" }
    u.full_name { "full name" }
  end
end
