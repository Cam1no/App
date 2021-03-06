# == Schema Information
#
# Table name: intermediate_table_article_tag_relations
#
#  id         :integer          not null, primary key
#  tag_id     :integer          not null
#  article_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  article_tag_relations_article_id  (article_id)
#  article_tag_relations_tag_id      (tag_id)
#  article_tag_relations_unique      (tag_id,article_id) UNIQUE
#

class IntermediateTable::ArticleTagRelation < ApplicationRecord
  belongs_to :article, class_name: 'Article::Base'
  belongs_to :tag, class_name: 'Article::Tag'
  validates :article_id, presence: true
  validates :tag_id, presence: true
end
