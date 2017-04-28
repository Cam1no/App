class Article::Base < ApplicationRecord
  belongs_to :user, class_name: "User::Base", foreign_key: "user_id"
end
