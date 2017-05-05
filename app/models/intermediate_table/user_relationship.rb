# == Schema Information
#
# Table name: intermediate_table_user_relationships
#
#  id           :integer          not null, primary key
#  follower_id  :integer          not null
#  following_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  user_relationships_follower_id   (follower_id)
#  user_relationships_following_id  (following_id)
#  user_relationships_unique        (follower_id,following_id) UNIQUE
#

class IntermediateTable::UserRelationship < ApplicationRecord
  belongs_to :following, class_name: 'User::Base'
  belongs_to :follower, class_name: 'User::Base'
  validates :following_id, presence: true
  validates :follower_id, presence: true
end
