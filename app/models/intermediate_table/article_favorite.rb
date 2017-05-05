# == Schema Information
#
# Table name: intermediate_table_article_favorites
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  article_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  article_favorites_article_id  (article_id)
#  article_favorites_unique      (user_id,article_id) UNIQUE
#  article_favorites_user_id     (user_id)
#

class IntermediateTable::ArticleFavorite < ApplicationRecord
  belongs_to :user, class_name: 'User::Base'
  belongs_to :article, class_name: 'Article::Base'
  validates :user_id, presence: true
  validates :article_id, presence: true
end
