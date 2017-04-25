class User::Relationship < ApplicationRecord
  belongs_to :following, class_name: "User::Base"
  belongs_to :follower, class_name: "User::Base"
  validates :following_id, presence: true
  validates :follower_id, presence: true
end
