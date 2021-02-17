class User < ApplicationRecord
    validates :username, :full_name,presence: true
    validates :username, uniqueness: {message: 'Username already taken'}
    validates :username, length: { in: 4..10 }

    validates :full_name, length: { maximum: 35 }
end
