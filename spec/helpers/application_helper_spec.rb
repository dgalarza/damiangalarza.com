require 'spec_helper'

describe ApplicationHelper do

  it "should generate peramlink path for post" do
    post = double("Post")
    post.stub(:slug).and_return('my-post')
    post.stub(:created_at).and_return(Date.parse("2009-07-26 18:03:12"))

    post_permalink_path(post).should == "/posts/2009/7/26/my-post"
  end
  
end
