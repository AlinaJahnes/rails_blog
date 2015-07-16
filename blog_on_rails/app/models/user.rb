class User < ActiveRecord::Base
  has_secure_password

  has_many :posts
  # if you say has_many :posts, dependent: :destroy, it will destroy all posts if the associated user is destroyed. Maybe not the best functionality in this instance, but definitely useful for a relationship between posts and comments -- you don't need the extra comments in your db if the post is gone. Just food for thought.
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
end
