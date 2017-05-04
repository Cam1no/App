# == Schema Information
#
# Table name: article_comments
#
#  id         :integer          not null, primary key
#  article_id :integer          not null
#  user_id    :integer          not null
#  text       :text(65535)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_article_comments_on_article_id              (article_id)
#  index_article_comments_on_article_id_and_user_id  (article_id,user_id)
#  index_article_comments_on_user_id                 (user_id)
#

class Article::Comment < ApplicationRecord
  belongs_to :article, class_name: 'Article::Base', foreign_key: 'article_id'
  belongs_to :user, class_name: 'User::Base', foreign_key: 'user_id'
  validates :article_id, presence: true
  validates :user_id, presence: true
end
