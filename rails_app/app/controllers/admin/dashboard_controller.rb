class Admin::DashboardController < Admin::AdminController
  def index
    @posts = Post.admin_table_fields.order('created_at DESC').includes(:category).limit(5)
    @comments = Comment.unscoped.admin_table_fields.order("created_at DESC").limit(10)
  end
end
