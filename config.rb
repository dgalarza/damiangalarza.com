require 'dotenv'
Dotenv.load

activate :blog do |blog|
  blog.layout = "article"
  blog.prefix = "posts/"
  blog.taglink = "tags/:tag.html"
  blog.tag_template = "tags.html"
  blog.permalink = ":category/:title.html"
  blog.default_extension = ".markdown"
  blog.custom_collections = {
    category: {
      link: 'categories/:category.html',
      template: 'categories.html'
    }
  }
end

activate :directory_indexes

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

set :markdown, :tables => true, :autolink => true, :gh_blockcode => true, :fenced_code_blocks => true
set :markdown_engine, :redcarpet

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash, ignore: [%r{^posts}]
  activate :gzip
end

helpers do
  # Format the publish date for display purposes
  #
  # @example 
  #   August 6, 1986
  #
  def format_date(date)
    date.strftime('%B %d, %Y')
  end

  def format_post_date(date)
    date.strftime('%B %d, %Y @ %I:%M<span class="meridian">%p</span>').html_safe
  end
end

activate :s3_sync do |s3_sync|
  s3_sync.bucket                     = ENV['AWS_S3_BUCKET']
  s3_sync.aws_access_key_id          = ENV['AWS_ACCESS_KEY']
  s3_sync.aws_secret_access_key      = ENV['AWS_SECRET_ACCESS_KEY']
  s3_sync.delete                     = false # We delete stray files by default.
  s3_sync.after_build                = false
  s3_sync.prefer_gzip                = true
  s3_sync.reduced_redundancy_storage = false
end
