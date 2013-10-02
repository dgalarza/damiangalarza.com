namespace :db do
  desc "Generate a post slug for all posts"
  task :slug_migration => :environment do
    @posts = Post.all
    @posts.each { |post| post.generate_slug; post.save }
  end

  desc "Cache existing comment markdown into HTML"
  task :comment_markdown_cache => :environment do
    @comments = Comment.all
    @comments.each { |comment| comment.format_markdown; comment.save }
  end

  desc "Cache exiting post markdonw as HTML"
  task :post_markdown_cache => :environment do
    @posts = Post.all
    @posts.each { |post| post.markdown_cache; post.save }
  end
end
