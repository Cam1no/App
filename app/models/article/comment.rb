class Article::Comment < ApplicationRecord
  belongs_to :article, class_name: 'Article::Base', foreign_key: 'article_id'
  belongs_to :user, class_name: 'User::Base', foreign_key: 'user_id'
end
