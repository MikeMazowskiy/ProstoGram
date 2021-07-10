class FollowsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:followed_user_id])
    follower_user = current_user
    following_user = @user

    Follower.create(follower: follower_user, followed_user: following_user)

    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @relation_id = Follower.where(follower_id: current_user, followed_user_id: @user).first!.id
    Follower.destroy(@relation_id)

    redirect_to user_path(@user)
  end

end
