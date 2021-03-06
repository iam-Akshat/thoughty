class User < ApplicationRecord
  validates :username, :full_name, :profile_pic, :cover_pic, presence: true
  validates :username, uniqueness: { message: 'Username already taken' }
  validates :username, length: { in: 4..10 }

  validates :full_name, length: { maximum: 35 }

  has_many :thoughties, inverse_of: :author, foreign_key: 'author_id'

  has_many :followers_following, class_name: 'Following', foreign_key: 'followed_id'
  has_many :followers, through: :followers_following, source: :follower

  has_many :followeds_following, class_name: 'Following', foreign_key: 'follower_id'
  has_many :followeds, through: :followeds_following, source: :followed

  has_one_attached :profile_pic
  has_one_attached :cover_pic
  def user_and_followers_tweets
    Thoughty.includes(:author).where(author: followeds.to_a << self).most_recent.limit(10)
  end

  def latest_non_followeds
    User.where.not(id: followeds.to_a.push(self)).order(created_at: :desc).take(4)
  end

  def follows_me?(diff_user)
    f = Following.where(followed: self, follower: diff_user).take
    f.nil? != true
  end
end
