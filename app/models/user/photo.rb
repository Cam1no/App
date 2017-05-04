# == Schema Information
#
# Table name: user_photos
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  removed    :boolean          default(TRUE)
#  image      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_user_photos_on_user_id  (user_id)
#

class User::Photo < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user, class_name: 'User::Base', inverse_of: :photos
end
