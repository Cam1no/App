class User::BasesController < ApplicationController
  before_action :set_user_basis, only: [:show, :edit, :update, :destroy]

  # GET /user/bases
  # GET /user/bases.json
  def index
    @user_bases = User::Base.includes(:followings, :followers)
  end

  # GET /user/bases/1
  # GET /user/bases/1.json
  def show
  end

  # GET /user/bases/new
  def new
    @user_basis = User::Base.new
  end

  # GET /user/bases/1/edit
  def edit
  end

  # POST /user/bases
  # POST /user/bases.json
  def create
    @user_basis = User::Base.new(user_basis_params)

    respond_to do |format|
      if @user_basis.save
        format.html { redirect_to @user_basis, notice: 'Base was successfully created.' }
        format.json { render :show, status: :created, location: @user_basis }
      else
        format.html { render :new }
        format.json { render json: @user_basis.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user/bases/1
  # PATCH/PUT /user/bases/1.json
  def update
    respond_to do |format|
      if @user_basis.update(user_basis_params)
        format.html { redirect_to root_path, notice: 'Base was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /user/bases/1
  # DELETE /user/bases/1.json
  def destroy
    @user_basis.destroy
    respond_to do |format|
      format.html { redirect_to user_bases_url, notice: 'Base was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_basis
      @user_basis = User::Base.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_basis_params
      params.require(:user_base).permit(:name, :email)
    end
end
