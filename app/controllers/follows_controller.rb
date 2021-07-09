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
    # @current_user.followed_user.find_by(follower_id: @user.id).destroy
    @followed_id = Follower.find_by_followed_user_id(@user).id
    @follower_id = Follower.find_by_follower_id(current_user).id

    if @followed_id == @follower_id
      @relation_id = @follower_id
      Follower.destroy(@relation_id)
    else
      flash[:warning] = "Error"
    end

    redirect_to user_path(@user)
  end

end
