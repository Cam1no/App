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

class User::Relationship < ApplicationRecord
  belongs_to :following, class_name: "User::Base"
  belongs_to :follower, class_name: "User::Base"
  validates :following_id, presence: true
  validates :follower_id, presence: true
end
