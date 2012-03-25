class Admin::DashboardController < Admin::AdminController
  def index
    @posts = Post.select('posts.id, published, posts.category_id, slug').includes(:category).limit(5)
    @comments = Comment.unscoped.select('comments.id, approved, username').order("created_at DESC").limit(10)
  end
end
