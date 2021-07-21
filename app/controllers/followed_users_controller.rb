class FollowedUsersController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @followed = @user.followed
  end
end
