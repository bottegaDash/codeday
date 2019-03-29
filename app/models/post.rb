class Post < ApplicationRecord
  belongs_to :user
  validates_presence_of :information
  scope :user_posts, ->(user) { where(user_id: user.id)}
end
