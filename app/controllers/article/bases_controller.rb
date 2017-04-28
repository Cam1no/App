class Article::BasesController < ApplicationController
  before_action :set_article_basis, only: [:show, :edit, :update, :destroy]

  # GET /article/bases
  # GET /article/bases.json
  def index
    @article_bases = Article::Base.all
  end

  # GET /article/bases/1
  # GET /article/bases/1.json
  def show
  end

  # GET /article/bases/new
  def new
    @article_basis = current_user.articles.build
  end

  # GET /article/bases/1/edit
  def edit
  end

  # POST /article/bases
  # POST /article/bases.json
  def create
    @article_basis = current_user.articles.build(article_basis_params)

    respond_to do |format|
      if @article_basis.save
        format.html { redirect_to @article_basis, notice: 'Base was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /article/bases/1
  # PATCH/PUT /article/bases/1.json
  def update
    respond_to do |format|
      if @article_basis.update(article_basis_params)
        format.html { redirect_to @article_basis, notice: 'Base was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /article/bases/1
  # DELETE /article/bases/1.json
  def destroy
    @article_basis.destroy
    respond_to do |format|
      format.html { redirect_to article_bases_url, notice: 'Base was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article_basis
      @article_basis = Article::Base.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_basis_params
      params.require(:article_base).permit(:title, :content, :description)
    end
end
