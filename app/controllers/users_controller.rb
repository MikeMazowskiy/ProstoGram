class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]

  def show
    @user  = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
  end

  def follow_user
    followed_user = params[:follow_id]
    if Follower.create!(follower_id: current_user.id, followed_user_id: followed_user)
      flash[:success] = "New followed"
    else
      flash[:warning] = "Error"
    end
  end

  def following?
    following_ids = Follower.where(follower_id: current_user.id)
    following_ids << current_user.id
    User.where.not(id: following_ids)
  end

  def update
    current_user.update(user_params)
    redirect_to current_user
  end

  private
  def user_params
    params.require(:user).permit(:username,:name,:website,:bio,:email,:phone,:gender,:avatar)
  end
end
