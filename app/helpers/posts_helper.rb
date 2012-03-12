require 'HTMLwithPygments'

module PostsHelper
  def post_markdown
    markdown = Redcarpet::Markdown.new(HTMLwithPygments, :autolink => true, :fenced_code_blocks => true)
    #syntax_highlight(markdown.render(@post.content)).html_safe
    markdown_html = markdown.render(@post.content)

    format_code_samples(markdown_html).html_safe
  end

  def format_code_samples(html)
    doc = Nokogiri::HTML::DocumentFragment.parse(html)
    nodes = doc.css '.highlighttable'
    nodes.wrap('<div class="code-block"></div>')

    doc.inner_html
  end

  def syntax_highlight(html)

    highlight_options = { :linenos => 'table', :tabwidth => 2 }

    doc = Nokogiri::HTML::DocumentFragment.parse(html)
    doc.css("code").each do |code_block|
      code_block.replace Pygments.highlight(code_block.inner_html.rstrip, :lexer => code_block[:class], :options => highlight_options)
    end

    doc.css('span.inline-code-block').each do |code_block|
      code_block.replace Pygments.highlight(code_block.text.rstrip, :lexer => code_block[:lang])
    end

    doc.css('.linenodiv, .linenos, .code').each do |code_block|
      code_block[:class] += ' highlight'
    end

    doc.to_s
  end

  def publish_date
    @post.created_at.strftime('%B %d, %Y')
  end

end
