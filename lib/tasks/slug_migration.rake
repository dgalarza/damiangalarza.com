namespace :db do
  desc "Generate a post slug for all posts"
  task :slug_migration => :environment do
    @posts = Post.all
    @posts.each { |post| post.generate_slug; post.save }
  end
end
