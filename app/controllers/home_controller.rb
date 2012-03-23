class HomeController < ApplicationController
  def index
    @posts = Post.where(:published => true).select("title, created_at, slug, category.name").includes(:category).limit(5)
  end
end
