class CommentsController < ApplicationController
  def new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    if @comment.save
      flash[:notice] = "Thanks for your comment!"
    else
      flash[:error] = "An error occurred while trying to save your comment."
    end

    redirect_to @post
  end
end
