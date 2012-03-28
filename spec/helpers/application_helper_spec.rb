require 'spec_helper'

describe ApplicationHelper do

  it "should generate peramlink path for post" do
    post = double("Post")
    category = double('Category')
    category.stub(:name).and_return('JavaScript')

    post.stub(:slug).and_return('my-post')
    post.stub(:category).and_return(category)

    post_permalink_path(post).should == "/posts/javascript/my-post"
  end
  
end
