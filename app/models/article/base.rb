class Article::Base < ApplicationRecord
  belongs_to :user, class_name: "User::Base", foreign_key: "user_id"

  has_many :like_articles, foreign_key: "article_id", class_name: "LikeArticle", dependent: :destroy
  has_many :likes, through: :like_articles, source: :user
end
