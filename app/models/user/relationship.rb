# == Schema Information
#
# Table name: user_relationships
#
#  id           :integer          not null, primary key
#  follower_id  :integer
#  following_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_user_relationships_on_follower_id                   (follower_id)
#  index_user_relationships_on_follower_id_and_following_id  (follower_id,following_id) UNIQUE
#  index_user_relationships_on_following_id                  (following_id)
#

class User::Relationship < ApplicationRecord
  belongs_to :following, class_name: 'User::Base'
  belongs_to :follower, class_name: 'User::Base'
  validates :following_id, presence: true
  validates :follower_id, presence: true
end
