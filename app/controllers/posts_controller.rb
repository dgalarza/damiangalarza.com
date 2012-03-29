class PostsController < ApplicationController

  def index
    @posts = Post.published.select("title, post.created_at, excerpt, slug, category_id").includes(:category)

    if params[:search]
      @posts = @posts.search "%#{params[:search]}%"
    elsif params[:tag]
      @posts = @posts.tagged params[:tag]
    elsif params[:category]
      @posts = @posts.in_category params[:category]
    end

    @posts.all
  end

  def show
    post_query = Post.where(:slug => params[:slug])
    post_query = post_query.select("posts.id, slug, title, cached_markdown, categories.id, categories.name, posts.created_at")
    post_query = post_query.joins(:category)
    post_query = post_query.includes(:category)
    @post = post_query.first

    authorize! :read, @post

    raise ActiveRecord::RecordNotFound unless @post

    @comment_count = @post.comments.count
    @comments = @post.comments.all

    if session[:invalid_comment]
      @comment = session[:invalid_comment]
    elsif current_user
      @comment = Comment.new(
        :email => current_user.email,
        :username => current_user.username
      )
    else
      @comment = Comment.new
    end
  end

end
