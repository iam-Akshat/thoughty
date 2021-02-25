# frozen_string_literal: true

FactoryBot.define do
  factory :thoughty do
    content { 'MyText' }

    author factory: :user
  end
end
