require 'HTMLwithPygments'

module PostsHelper

  # Run the post through the Redcarpet markdown interpretter to generate HTML
  # from Markdown using the custom HTMLwithPygments renderer to add syntax
  # highlight in to any code snippets found
  #
  # @see HTMLwithPygments
  # @return HTML String for commment
  def post_markdown(post)
    format_code_samples(post).html_safe
  end

  # Wrap any code blocks found generated by pygments within a div
  # with class code block to handle presentation within the post
  #
  # @example
  #   <table class="highlighttable">...</table>
  #   =>
  #   <div class="code-block">
  #     <table class="highlighttable">...</table>
  #   </div>
  #
  # @param [String] html HTML to look inside
  def format_code_samples(html)
    doc = Nokogiri::HTML::DocumentFragment.parse(html)
    nodes = doc.css '.highlight'
    nodes.wrap('<div class="code-block"></div>')

    doc.inner_html
  end

end
