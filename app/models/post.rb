require 'HTMLwithPygments'

class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :comments
  has_and_belongs_to_many :tags

  default_scope :order => 'posts.created_at DESC'

  scope :published, where(:published => true)

  scope :search, lambda { |query|
    where('title LIKE ? OR content LIKE ?', query, query)
  }

  scope :tagged, lambda { |tag|
    joins('INNER JOIN posts_tags ON posts_tags.post_id = posts.id').where('posts_tags.tag_id' => tag)
  }

  scope :in_category, lambda { |category|
    where(:category_id => category)
  }

  scope :admin_table_fields, select('posts.id, title, published, posts.category_id, slug')

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
