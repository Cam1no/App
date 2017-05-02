class User::RelationshipsController < ApplicationController
  # GET /user/relationships
  # GET /user/relationships.json
  def index
    @user_relationships = User::Relationship.all
  end

  # GET /user/relationships/1
  # GET /user/relationships/1.json
  def show; end

  # GET /user/relationships/new
  def new
    @user_relationship = User::Relationship.new
  end

  # GET /user/relationships/1/edit
  def edit; end

  # POST /user/relationships
  # POST /user/relationships.json
  def create
    user_id = params[:user_id]
    @follow = current_user.following_relationships.build(following_id: user_id)
    if @follow.save
      redirect_to user_bases_path
    else
      redirect_to user_bases_path
    end
  end

  # PATCH/PUT /user/relationships/1
  # PATCH/PUT /user/relationships/1.json
  def update
    respond_to do |format|
      if @user_relationship.update(user_relationship_params)
        format.html { redirect_to @user_relationship, notice: 'Relationship was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_relationship }
      else
        format.html { render :edit }
        format.json { render json: @user_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user/relationships/1
  # DELETE /user/relationships/1.json
  def destroy
    current_user.following_relationships.find_by(following_id: params[:id]).destroy
    redirect_to user_bases_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
end
