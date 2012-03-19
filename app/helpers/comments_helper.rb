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

end
