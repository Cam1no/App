class Ajax::Article::LikesController < ApplicationController
  def create
    @article = ::Article::Base.find_by(id: params[:intermediate_table_article_favorite][:article_id])
    current_user.like_articles.create(article_id: params[:intermediate_table_article_favorite][:article_id])
  end

  def destroy
    @article = ::Article::Base.find_by(id: params[:id])
    current_user.like_articles.find_by(article_id: params[:id]).destroy
  end
end
