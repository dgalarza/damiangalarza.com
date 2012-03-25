class Admin::PostsController < Admin::AdminController
  def index
    @posts = Post.admin_table_fields.includes(:category).limit(25)
  end

  def edit
    @post = Post.find(params[:post_id])
  end
end
