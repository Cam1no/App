class LikeArticlesController < ApplicationController

  def create
    @like = current_user.like_articles.build(article_id: params[:article_id])
    if @like.save
      redirect_to article_bases_path
    end
  end

  def destroy
    @like = current_user.like_articles.where(article_id: params[:id]).first
    if @like.destroy
      redirect_to article_bases_path
    else
      redirect_to article_bases_path
    end
  end

end
