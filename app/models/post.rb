require 'HTMLwithPygments'

class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :comments
  has_and_belongs_to_many :tags

  before_save :generate_slug
  before_save :markdown_cache

  def generate_slug
    self.slug = self.title.downcase.gsub(' - ', '-').gsub(' ', '-')
  end

  def markdown_cache
    markdown = Redcarpet::Markdown.new(HTMLwithPygments, :autolink => true, :fenced_code_blocks => true, :no_intra_emphasis => true)
    markdown_html = markdown.render(self.content)

    self.cached_markdown = markdown_html
  end

end
