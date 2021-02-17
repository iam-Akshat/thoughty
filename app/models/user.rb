class User < ApplicationRecord
    validates :username, :full_name,presence: true
    validates :username, uniqueness: {message: 'Username already taken'}
    validates :username, length: { in: 4..10 }

    validates :full_name, length: { maximum: 35 }

    has_many :thoughties, inverse_of: :author,foreign_key:'author_id'


    has_many :followers_following, class_name: 'Following',foreign_key: 'followed_id'
    has_many :followers,through: :followers_following,source: :follower
    
    has_many :followeds_following, class_name: 'Following',foreign_key: 'follower_id'
    has_many :followeds,through: :followeds_following,source: :followed
end
