require 'HTMLwithPygments'

class Comment < ActiveRecord::Base
  belongs_to :post
  attr_protected :post_id

  before_save :format_markdown

  # Format the comment as markdown, caching markdown HTML in the database
  def format_markdown
    options = { :autolink => true, :fenced_code_blocks => true }
    renderer = HTMLwithPygments.new :filter_html => true

    markdown = Redcarpet::Markdown::new(renderer, options)
    self.comment = markdown.render(self.comment)
  end

end
