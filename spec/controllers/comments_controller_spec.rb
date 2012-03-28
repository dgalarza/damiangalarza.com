require 'spec_helper'

describe CommentsController do

  def do_create
    @post = FactoryGirl.create(:post)
    post :create, :post_id => @post.id
  end

  it "should redirect back to blog post" do
    do_create
    response.should redirect_to( blog_permalink_path(:category => @post.category.name.downcase, :slug => @post.slug) )
  end

end
