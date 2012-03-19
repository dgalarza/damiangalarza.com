module ApplicationHelper

  # Format the publish date for display purposes
  #
  # @example 
  #   August 6, 1986
  #
  def format_date(date)
    date.strftime('%B %d, %Y')
  end

  # Generate the path for a post permalink
  #
  # @example
  #   post = Post.new(:created_at => Date.parse("2009-07-26 18:03:12"), :slug => 'my-post')
  #   post_permalink_path(post) # => /2009/7/26/my-post
  #
  # @param [<#Post>] post Post to generate permalink path for
  def post_permalink_path(post)
    date = post.created_at
    "/posts/#{date.year}/#{date.month}/#{date.day}/#{post.slug}"
  end

  def post_permalink_url(post)
    url_for post_permalink_path(post)
  end

end
