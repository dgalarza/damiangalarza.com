require 'HTMLwithPygments'

module PostsHelper

  def post_markdown
    markdown = Redcarpet::Markdown.new(HTMLwithPygments, :autolink => true, :fenced_code_blocks => true)
    markdown_html = markdown.render(@post.content)
    format_code_samples(markdown_html).html_safe
  end

  def format_code_samples(html)
    doc = Nokogiri::HTML::DocumentFragment.parse(html)
    nodes = doc.css '.highlighttable'
    nodes.wrap('<div class="code-block"></div>')

    doc.inner_html
  end

  def publish_date
    @post.created_at.strftime('%B %d, %Y')
  end

end
