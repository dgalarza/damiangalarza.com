require 'HTMLwithPygments'

class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :comments

  acts_as_taggable

  scope :published, where(:published => true)

  scope :search, lambda { |query|
    where('title LIKE ? OR content LIKE ?', query, query)
  }

  scope :in_category, lambda { |category|
    where(:category_id => category)
  }

  scope :admin_table_fields, select('posts.id, title, published, posts.category_id, slug')

  before_save :set_publish_date
  before_save :generate_slug
  before_save :markdown_cache

  validates :category, :presence => { :message => 'is required' }

  def generate_slug
    unless self.slug and not published?
      self.slug = self.title.downcase.gsub(/\.|\s-\s|\s/, '-').gsub(/[@\{\}\?\!%]/, '')
    end
  end

  def set_publish_date
    unless publish_date
      self.publish_date = Time.now if published?
    end
  end

  def markdown_cache
    markdown = Redcarpet::Markdown.new(HTMLwithPygments, :autolink => true, :fenced_code_blocks => true, :no_intra_emphasis => true)
    markdown_html = markdown.render(self.content)

    self.cached_markdown = markdown_html
  end

end
