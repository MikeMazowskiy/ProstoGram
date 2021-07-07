class FollowersController < ApplicationController
  def index
    @user = User.find(params[:id])
    @follwers = @user.followers
  end
end
