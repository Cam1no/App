# == Schema Information
#
# Table name: article_photos
#
#  id         :integer          not null, primary key
#  article_id :integer          not null
#  removed    :boolean          default(TRUE)
#  image      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_article_photos_on_article_id  (article_id)
#

class Article::Photo < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :article, class_name: 'Article::Base', inverse_of: :photos
end
