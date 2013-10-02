class HomeController < ApplicationController
  def index
    @posts = Post.published.order('publish_date DESC').select("title, created_at, slug, category.name").includes(:category).limit(5)
  end
end
