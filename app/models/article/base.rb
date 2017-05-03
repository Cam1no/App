# == Schema Information
#
# Table name: article_bases
#
#  id          :integer          not null, primary key
#  title       :string(255)      not null
#  content     :text(65535)      not null
#  description :text(65535)      not null
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Article::Base < ApplicationRecord
  belongs_to :user, class_name: 'User::Base', foreign_key: 'user_id'

  has_many :like_articles, foreign_key: 'article_id', class_name: 'LikeArticle', dependent: :destroy
  has_many :likes, through: :like_articles, source: :user

  has_many :tag_relations, foreign_key: 'article_id', class_name: 'Article::TagRelation', dependent: :destroy
  has_many :tags, through: :tag_relations, source: :tag

  has_many :photos, class_name: 'Article::Photo', foreign_key: 'article_id', dependent: :destroy, inverse_of: :article
  accepts_nested_attributes_for :photos

  has_many :comments, class_name: "Article::Comment", foreign_key: "article_id", dependent: :destroy, inverse_of: :article

  def main_photo
    photos.first.image
  end
end
