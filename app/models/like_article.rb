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

class LikeArticle < ApplicationRecord
  belongs_to :user, class_name: 'User::Base'
  belongs_to :article, class_name: 'Article::Base'
end
