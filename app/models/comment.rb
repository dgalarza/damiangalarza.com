require 'HTMLwithPygments'

class Comment < ActiveRecord::Base
  include Rakismet::Model

  default_scope :conditions => ["approved", true], :order => 'created_at DESC'

  scope :admin_table_fields, select('comments.id, approved, username')

  belongs_to :post
  attr_protected :post_id

  before_create :format_markdown
  before_create :check_for_spam

  validates :email,    :presence => true
  validates :comment,  :presence => true
  validates :username, :presence => true

  # Map rakismet attributes to the model
  rakismet_attrs :author => :username, :author_email => :email, :author_url => :website, :content => :comment, :user_ip => :ip

  def request=(request)
    self.ip = request.remote_ip
    self.user_agent = request.env['HTTP_USER_AGENT']
    self.referrer = request.env['HTTP_REFERER']
  end

  def check_for_spam
    self.approved = !self.spam?
    true
  end

  # Format the comment as markdown, caching markdown HTML in the database
  def format_markdown
    options = { :autolink => true, :fenced_code_blocks => true, :no_intra_emphasis => true }
    renderer = HTMLwithPygments.new :filter_html => true

    markdown = Redcarpet::Markdown::new(renderer, options)
    self.comment = markdown.render(self.comment)
  end

  def email_hash
    Digest::MD5.hexdigest(self.email.downcase)
  end

end
