class FollowedUsersController < ApplicationController
  def index
    @user = User.find(params[:id])
    @followed_user = @user.followed_user
  end
end
