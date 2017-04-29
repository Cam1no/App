class Article::Photo < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :article, class_name: 'Article::Base'
end
