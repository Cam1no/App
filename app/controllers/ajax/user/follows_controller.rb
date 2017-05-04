class Ajax::User::FollowsController < ApplicationController
  def create
    @user = ::User::Base.find_by(id: follow_params[:following_id])
    current_user.follow!(@user)
  end

  def destroy
    @user = ::User::Base.find_by(id: unfollow_params[:id])
    current_user.unfollow!(@user)
  end

  private

  def follow_params
    params.require(:intermediate_table_user_relationship).permit(:following_id)
  end

  def unfollow_params
    params.permit(:id)
  end
end
