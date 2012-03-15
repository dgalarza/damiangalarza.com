module CommentsHelper
  def gravatar(email)
    gravatar_id = Digest::MD5.hexdigest(email.downcase)
    "//gravatar.com/avatar/#{gravatar_id}.png?s=60r=pg"
  end
end
