class HomeController < ApplicationController
  def index
    @posts = Post.published.select("title, created_at, slug, category.name").includes(:category).limit(5)
  end
end
