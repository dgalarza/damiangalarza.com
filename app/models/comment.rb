class Comment < ActiveRecord::Base
  belongs_to :post
  attr_protected :post_id
end
