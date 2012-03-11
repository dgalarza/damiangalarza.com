require 'redcarpet'
require 'nokogiri'

module PostsHelper
  def post_markdown
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    syntax_highlight(markdown.render(@post.content)).html_safe
  end

  def syntax_highlight(html)

    highlight_options = { :linenos => 'table', :tabwidth => 2 }

    doc = Nokogiri::HTML::DocumentFragment.parse(html)
    doc.css("code.block").each do |code_block|
      code_block.replace Pygments.highlight(code_block.inner_html.rstrip, :lexer => code_block[:lang], :options => highlight_options)
    end

    doc.css('span.inline-code-block').each do |code_block|
      code_block.replace Pygments.highlight(code_block.inner_html.rstrip, :lexer => code_block[:lang])
    end

    doc.css('.linenodiv, .linenos, .code').each do |code_block|
      code_block[:class] += ' highlight'
    end

    doc.to_s
  end

end
