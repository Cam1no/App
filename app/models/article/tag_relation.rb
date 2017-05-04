# == Schema Information
#
# Table name: article_tag_relations
#
#  id         :integer          not null, primary key
#  tag_id     :integer
#  article_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_article_tag_relations_on_article_id             (article_id)
#  index_article_tag_relations_on_tag_id                 (tag_id)
#  index_article_tag_relations_on_tag_id_and_article_id  (tag_id,article_id) UNIQUE
#

class Article::TagRelation < ApplicationRecord
  belongs_to :article, class_name: 'Article::Base'
  belongs_to :tag, class_name: 'Article::Tag'
  validates :article_id, presence: true
  validates :tag_id, presence: true
end
