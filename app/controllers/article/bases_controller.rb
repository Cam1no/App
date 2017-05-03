class Article::BasesController < ApplicationController
  before_action :set_article_basis, only: %i[show edit update destroy]

  # GET /article/bases
  # GET /article/bases.json
  def index
    @article_bases = Article::Base.includes(:like_articles, :user, :tags)
  end

  # GET /article/bases/1
  # GET /article/bases/1.json
  def show
  end

  # GET /article/bases/new
  def new
    @article = current_user.articles.build
    @article.photos.build
  end

  # GET /article/bases/1/edit
  def edit; end

  # POST /article/bases
  # POST /article/bases.json
  def create
    @article = current_user.articles.create(article_basis_params)
    if params[:tag].present?
      tag_names = params[:tag].split(' ')
      tag_names.each do |tag_name|
        @tag = Article::Tag.find_or_create_by(name: tag_name)
        @article.tag_relations.create(tag_id: @tag.id)
      end
    end
    redirect_to article_basis_path(@article), notice: '記事を投稿しました'
  end

  # PATCH/PUT /article/bases/1
  # PATCH/PUT /article/bases/1.json
  def update
    if @article.update(article_basis_params)
      if params[:tag].present?
        tag_names = params[:tag].split(' ')
        tag_names.each do |tag_name|
          @tag = Article::Tag.find_or_create_by(name: tag_name)
          @article.tag_relations.create(tag_id: @tag.id)
        end
      end
      redirect_to article_basis_path(@article), notice: '記事を更新しました'
    else
      render 'edit'
    end
  end

  # DELETE /article/bases/1
  # DELETE /article/bases/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to article_bases_url, notice: 'Base was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article_basis
    @article = Article::Base.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def article_basis_params
    params.require(:article_base).permit(:title, :content, :description, photos_attributes: [:image])
  end
end
