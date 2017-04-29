# == Schema Information
#
# Table name: article_tags
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Article::Tag < ApplicationRecord
  has_many :tag_relations, foreign_key: 'tag_id', class_name: 'Article::TagRelation', dependent: :destroy
  has_many :articles, through: :tag_relations, source: :article
end
