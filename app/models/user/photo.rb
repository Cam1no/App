class User::Photo < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user, class_name: 'User::Base', inverse_of: :photos
end
