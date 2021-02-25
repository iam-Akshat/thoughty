# frozen_string_literal: true

class Thoughty < ApplicationRecord
  validates :content, presence: true
  validates :content, length: { maximum: 50 }
  belongs_to :author, inverse_of: :thoughties, class_name: 'User'

  scope :most_recent, -> { order(created_at: :desc) }
end
