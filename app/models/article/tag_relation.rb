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

class Article::TagRelation < ApplicationRecord
  belongs_to :article, class_name: "Article::Base"
  belongs_to :tag, class_name: "Article::Tag"
end
