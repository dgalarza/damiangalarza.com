class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :comments
  has_and_belongs_to_many :tags

  before_save :generate_slug

  def generate_slug
    self.slug = self.title.downcase.gsub(' - ', '-').gsub(' ', '-')
  end

end
