class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    if liked?
      flash[:notice] = "Have you already liked this post"
    else
      @post.likes.create(user_id: current_user.id)
    end
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = @post.likes.find(params[:id])
    @like.destroy
    redirect_to post_path(@post)
  end
  private
  def liked?
    Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
  end
end
