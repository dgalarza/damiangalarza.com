class CommentsController < ApplicationController

  respond_to :json, :only => :index

  def index
    @comments = Comment.where(:post_id => params[:post_id]).limit(10)
    @comments = @comments.offset(params[:skip]) if params[:skip]

    render :json => @comments.as_json(:except => [:email], :methods => [:email_hash])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    @comment.request = request
    if @comment.save
      flash[:notice] = "Thanks for your comment!"
    else
      flash[:error] = "An error occurred while trying to save your comment."
    end

    redirect_to blog_permalink_path(:year => @post.created_at.year, :month => @post.created_at.month, :day => @post.created_at.day, :slug => @post.slug)
  end

end
