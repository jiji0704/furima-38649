class Relationship < ApplicationRecord
  belongs_to :following, class_name: "User"
  belongs_to :follower, class_name: "User"

  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id

  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id

  has_many :followings, through: :active_relationships, source: :follower

  has_many :followers, through: :passive_relationships, source: :following
end
