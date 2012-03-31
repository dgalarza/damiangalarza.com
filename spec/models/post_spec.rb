require 'spec_helper'

describe Post do

  describe "Post slugs" do
    it "should only generate a slug when the post is published" do
      post = FactoryGirl.create(:post, :published => false, :slug => nil)
      post.generate_slug.should == nil
    end

    it "should generate a post slug" do
      post = FactoryGirl.create(:post, :title => 'My Post', :slug => nil)
      post.generate_slug.should == 'my-post'
    end

    it "should remove any dashes that exist in title" do
      post = FactoryGirl.create(:post, :title => 'My - Awesome - Post', :slug => nil) 
      post.generate_slug.should == 'my-awesome-post'
    end

    it "should replace any periods with dashes" do
      post = FactoryGirl.create(:post, :title => 'My Site.com', :slug => nil)
      post.generate_slug.should == 'my-site-com'
    end
  end

end
