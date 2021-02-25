FactoryBot.define do
  factory :following do
    follower factory: :user
    followed factory: :user
  end
end
