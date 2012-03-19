xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Damian Galarza"
    xml.description "Development Blo"
    xml.link posts_url

    for post in @posts
      xml.item do
        xml.title post.title
        xml.subtitle post.subtitle
        xml.description post_markdown(post.content)
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link post_permalink_url(post)
        xml.guid post_permalink_url(post)
      end
    end
  end
end
