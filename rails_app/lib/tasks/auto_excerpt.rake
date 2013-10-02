namespace :db do
  desc "Migrate wordpress posts creating an excerpt"
  task :auto_excerpt => :environment do

    @posts = Post.all
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)

    @posts.each do |post|
      markdown_html = markdown.render post.content
      doc = Nokogiri::HTML::DocumentFragment.parse markdown_html
      excerpt = doc.css('p').first

      post.excerpt = excerpt.inner_html
      post.save
    end

  end
end
