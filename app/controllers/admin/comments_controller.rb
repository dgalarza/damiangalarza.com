class Admin::CommentsController < Admin::AdminController

  before_filter :find_comment, :only => [:mark_as_spam, :unmark_as_spam]

  def index
    @comments = Comment.unscoped.admin_table_fields.order('created_at DESC')
  end

  def edit
    @comment = Comment.unscoped.find params[:id]
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.delete
    
    flash[:notice] = 'Comment deleted'
    redirect_to :admin_comments
  end

  def spam
    @comment = Comment.unscoped.find params[:comment_id]
    @comment.mark_as_spam
    render :json => { :status => "Success" }
  end

  def unspam
    @comment = Comment.unscoped.find params[:comment_id]
    @comment.unmark_as_spam
    render :json => { :status => "Success" }
  end

end
