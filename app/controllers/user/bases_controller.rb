class User::BasesController < ApplicationController
  before_action :set_user_basis, only: %i[show edit update destroy]

  # GET /user/bases
  # GET /user/bases.json
  def index
    @user_bases = User::Base.includes(:followings, :followers) - [current_user]
  end

  # GET /user/bases/1
  # GET /user/bases/1.json
  def show; end

  # GET /user/bases/1/edit
  def edit
    @user.photos.build
  end

  # PATCH/PUT /user/bases/1
  # PATCH/PUT /user/bases/1.json
  def update
    if @user.update(user_basis_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  # DELETE /user/bases/1
  # DELETE /user/bases/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to user_bases_url, notice: 'Base was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user_basis
    @user = User::Base.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_basis_params
    params.require(:user_base).permit(:name, :email, photos_attributes: [:image])
  end
end
