class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def index
    redirect_to home_index_path
  end

  def create
    Post.create(post_params)
    redirect_to home_index_path
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy

    redirect_to  user_path(current_user)
  end

  def show
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:description, :image, :user_id, :id)
  end
end
