class PostsController < ApplicationController

  def index
    @posts = Post.select("title, created_at, excerpt, slug, category_id").order("created_at DESC").includes(:category).all
  end

  def show
    post_query = Post.where(:slug => params[:slug])
    post_query = post_query.select("id, slug, title, cached_markdown, category_id, created_at")
    post_query = post_query.includes(:category)
    @post = post_query.first

    @comment_count = @post.comments.count
    @comments = @post.comments.limit(10)

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
