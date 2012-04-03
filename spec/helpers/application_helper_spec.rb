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

  describe "display_admin?" do

    it "should not display admin if no user is logged in" do
      helper.stub(:current_user).and_return(nil)
      helper.display_admin?.should be_false
    end

    specify "display_admin if the user is an admin" do
      user = FactoryGirl.create(:user, :admin => true)
      helper.stub(:current_user).and_return(user)
      helper.display_admin?.should be_true
    end

    specify "display_admin should be false if user is not an admin" do
      user = FactoryGirl.create(:user, :admin => false)
      helper.stub(:current_user).and_return(user)
      helper.display_admin?.should be_false
    end

  end

end
