class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id if user_signed_in?

    if @comment.save
      redirect_to post_path(@post)
    else
      redirect_to home_index_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @comment = Comment.find(params[:post_id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id, :comment)
  end
end
