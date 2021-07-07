class FollowsController < ApplicationController
  before_action :authenticate_user!

  def create
    follower_user = current_user
    following_user = User.find(params[:followed_user_id])

    Follower.create(follower: follower_user, followed_user: following_user)

    redirect_to user_path(current_user)
  end
end
