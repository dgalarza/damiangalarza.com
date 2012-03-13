class PostsController < ApplicationController
  def index

  end

  def show
    @post = Post.find(params[:id])
    if current_user
      @comment = @post.comments.build({
        :email => current_user.email,
        :username => current_user.username
      })
    else
      @comment = @post.comments.build
    end
  end
end
