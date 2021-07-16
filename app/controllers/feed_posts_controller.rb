class FeedPostsController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.followed_user.exists?
      @posts = Post.where(user_id: current_user.followed_user.pluck(:id)).order(created_at: :desc)
    else
      Post.none
    end
  end
end
