require 'spec_helper'

describe Post do
  pending "add some examples to (or delete) #{__FILE__}"

  describe "Post slugs" do
    it "should generate a post slug" do
      post = Post.new(:title => 'My Post')
      post.generate_slug.should == 'my-post'
    end

    it "should remove any dashes that exist in title" do
      post = Post.new(:title => 'My - Awesome - Post')
      post.generate_slug.should == 'my-awesome-post'
    end
  end

end
