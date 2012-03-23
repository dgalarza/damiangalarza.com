class CommentsController < ApplicationController

  respond_to :json, :only => :index

  def index
    @comments = Comment.where(:post_id => params[:post_id]).limit(10)
    @comments = @comments.offset(params[:skip]) if params[:skip]

    render :json => @comments.as_json(:except => [:email], :methods => [:email_hash])
  end

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
