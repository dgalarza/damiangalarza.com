class PostsController < ApplicationController

  def index
    @posts = Post.select("title, created_at, excerpt, slug, category_id").order("created_at DESC").includes(:category).all
  end

  def show
    post_query = Post.where(:slug => params[:slug])
    post_query.select("slug, title, cached_markdown, category_id, created_at")
    post_query.includes(:category)
    post_query.includes(:comments)

    @post = post_query.first

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
