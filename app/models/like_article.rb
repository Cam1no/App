# == Schema Information
#
# Table name: like_articles
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  article_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_like_articles_on_article_id              (article_id)
#  index_like_articles_on_user_id                 (user_id)
#  index_like_articles_on_user_id_and_article_id  (user_id,article_id) UNIQUE
#

class LikeArticle < ApplicationRecord
  belongs_to :user, class_name: 'User::Base'
  belongs_to :article, class_name: 'Article::Base'
end
