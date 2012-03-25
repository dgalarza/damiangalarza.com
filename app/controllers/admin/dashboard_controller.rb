class Admin::DashboardController < Admin::AdminController
  def index
    @posts = Post.admin_table_fields.includes(:category).limit(5)
    @comments = Comment.unscoped.select('comments.id, approved, username').order("created_at DESC").limit(10)
  end
end
