class Admin::CommentsController < Admin::AdminController
  def index
    @comments = Comment.unscoped.admin_table_fields.order('created_at DESC').limit(20)
  end

  def edit
    @comment = Comment.find(params[:id])
  end
end
