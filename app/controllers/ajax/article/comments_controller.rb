class Ajax::Article::CommentsController < ApplicationController
  def create
    @article = ::Article::Base.find(params[:article_id])
    @article.comments.create(text: params[:comment_field], user_id: current_user.id)
  end
end
