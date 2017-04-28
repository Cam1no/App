class LikeArticle < ApplicationRecord
  belongs_to :user, class_name: "User::Base"
  belongs_to :article, class_name: "Article::Base"
end
