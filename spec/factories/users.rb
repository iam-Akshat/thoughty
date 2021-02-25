# frozen_string_literal: true

FactoryBot.define do
  factory :user do |u|
    u.sequence(:username) { |n| "user-#{n}" }
    u.full_name { 'full name' }
    profile_pic { Rack::Test::UploadedFile.new('spec/fixtures/test_img.jpg', 'image/png') }
    cover_pic { Rack::Test::UploadedFile.new('spec/fixtures/test_img.jpg', 'image/png') }
  end
end
