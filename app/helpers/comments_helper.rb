module CommentsHelper

  # Generate gravatar image URL based on the email provided
  def gravatar(email)
    gravatar_id = Digest::MD5.hexdigest(email.downcase)
    "//gravatar.com/avatar/#{gravatar_id}.png?s=60r=pg"
  end

  def comment_timestamp(timestamp)
    timestamp.strftime('%I:%M<span class="meridian">%p</span> on %B %D, %Y').html_safe
  end

  # Properly display a comment's author linking their username if
  # they provided a website URL with their comment
  #
  # @param [Comment] comment
  def comment_author(comment)
    if comment.website
      link_to comment.username, comment.website
    else
      comment.username
    end
  end

  # Run the comment through the Redcarpet Markdown interpretter to generate HTML from
  # Markdown from using the custom HTMLwithPygments renderer to add syntax highlighting
  #
  # @see HTMLwithPygments
  # @return HTML String for comment
  def comment_markdown(comment_content)
    options = { :autolink => true, :fenced_code_blocks => true }
    renderer = HTMLwithPygments.new :filter_html => true

    markdown = Redcarpet::Markdown::new(renderer, options)
    markdown.render(comment_content).html_safe
  end

end
