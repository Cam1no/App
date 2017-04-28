class Article::TagRelation < ApplicationRecord
  belongs_to :article, class_name: "Article::Base"
  belongs_to :tag, class_name: "Article::Tag"
end
