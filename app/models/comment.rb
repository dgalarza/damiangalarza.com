require 'HTMLwithPygments'
require 'email_validator'

class Comment < ActiveRecord::Base
  include Rakismet::Model

  default_scope :conditions => ["approved", true], :order => 'created_at ASC'

  scope :admin_table_fields, select('comments.id, approved, username, comment')

  belongs_to :post
  attr_protected :post_id

  before_create :format_markdown
  before_create :check_for_spam


  validates :email,    :presence => { :message => 'is required' }, :email => { :message => 'is not a valid email address' }
  validates :comment,  :presence => { :message => 'is required' }
  validates :username, :presence => { :message => 'is required' }

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

  def mark_as_spam
    spam!
    self.approved = false;
    self.save
  end

  def unmark_as_spam
    ham!
    self.approved = true
    self.save
  end

  # Format the comment as markdown, caching markdown HTML in the database
  def format_markdown
    options = { :autolink => true, :fenced_code_blocks => true, :no_intra_emphasis => true }
    renderer = HTMLwithPygments.new :filter_html => true

    markdown = Redcarpet::Markdown::new(renderer, options)
    self.markdown_cache = markdown.render(self.comment)
  end

  def email_hash
    Digest::MD5.hexdigest(self.email.downcase)
  end

end
