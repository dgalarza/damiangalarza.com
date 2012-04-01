class Admin::PostsController < Admin::AdminController
  def index
    @posts = Post.admin_table_fields.includes(:category).order('created_at DESC').limit(25)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build params[:post]
    @post.save

    redirect_to edit_admin_post_path(@post)
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(params[:post])

    @post.save

    redirect_to :admin_posts
  end
end
