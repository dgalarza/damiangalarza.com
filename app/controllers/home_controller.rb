class HomeController < ApplicationController
  def index
    @posts = Post.where(:published => true).order('created_at DESC').select("title, created_at, slug").limit(5)
  end
end
