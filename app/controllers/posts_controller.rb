class PostsController < ApplicationController

  def index
    @posts = Post.select("title, post.created_at, excerpt, slug, category_id").order("posts.created_at DESC").includes(:category)

    if params[:search]
      search = "%#{params[:search]}%"
      @posts = @posts.where('title LIKE ? OR content LIKE ?', search, search)
    elsif params[:tag]
      @posts = @posts.joins('INNER JOIN posts_tags ON posts_tags.post_id = posts.id').where("posts_tags.tag_id" =>  params[:tag])
    elsif params[:category]
      @posts = @posts.where(:category_id => params[:category])
    end

    @posts.all
  end

  def show
    post_query = Post.where(:slug => params[:slug])
    post_query = post_query.select("id, slug, title, cached_markdown, category_id, created_at")
    post_query = post_query.includes(:category)
    @post = post_query.first

    @comment_count = @post.comments.count
    @comments = @post.comments.order('created_at DESC').limit(10)

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
