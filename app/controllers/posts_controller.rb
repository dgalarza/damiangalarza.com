class PostsController < ApplicationController
  def index

  end

  def show
    @post = Post.find(params[:id])
    if current_user
      @comment = Comment.new(
        :email => current_user.email,
        :username => current_user.username
      )
    else
      @comment = Comment.new
    end
  end
end
