# == Schema Information
#
# Table name: user_bases
#
#  id                     :integer          not null, primary key
#  name                   :string(255)      default("Guest"), not null
#  email                  :string(255)      not null
#  sentence               :text(65535)
#  image                  :string(255)
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string(255)
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_user_bases_on_confirmation_token    (confirmation_token) UNIQUE
#  index_user_bases_on_email                 (email) UNIQUE
#  index_user_bases_on_name                  (name) UNIQUE
#  index_user_bases_on_reset_password_token  (reset_password_token) UNIQUE
#  index_user_bases_on_unlock_token          (unlock_token) UNIQUE
#

class User::Base < ApplicationRecord
  mount_uploader :image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :following_relationships, foreign_key: 'follower_id', class_name: 'IntermediateTable::UserRelationship', dependent: :destroy
  has_many :followings, through: :following_relationships

  has_many :follower_relationships, foreign_key: 'following_id', class_name: 'IntermediateTable::UserRelationship', dependent: :destroy
  has_many :followers, through: :follower_relationships

  has_many :articles, class_name: 'Article::Base', foreign_key: 'user_id'

  has_many :like_articles, foreign_key: 'user_id', class_name: 'IntermediateTable::ArticleFavorite', dependent: :destroy
  has_many :likes, through: :like_articles, source: :article

  has_many :comments, class_name: 'Article::Comment', foreign_key: 'user_id', inverse_of: :user, dependent: :destroy

  has_many :chat_room_relations, foreign_key: 'user_id', class_name: 'IntermediateTable::ChatRoomUserRelation', dependent: :destroy
  has_many :chat_rooms, through: :chat_room_relations

  has_many :chat_messages, foreign_key: 'user_id', class_name: 'Chat::Message', dependent: :destroy

  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end

  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end

  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end

  def like?(article)
    like_articles.find_by(article_id: article.id).present?
  end

  def join?(chat_room)
    chat_rooms.include?(chat_room)
  end
end
