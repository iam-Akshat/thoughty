FactoryBot.define do
  factory :thoughty do
    content { "MyText" }

    author factory: :user
  end
end
