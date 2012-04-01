require 'spec_helper'

describe PostsController do

  describe "Routes" do
    it "should route to post by category and post slug" do
      assert_routing("/posts/javascript/post-title", :controller => 'posts', :action => 'show', :method => :get, :category => 'javascript', :slug => 'post-title')
    end
  end

  describe "Commenting" do

    before do
      controller.stub(:authorize!).and_return true
      @post = FactoryGirl.create(:post)
    end

    def get_post
      get :show, :slug => @post.slug
    end

    it "should assign comm/nt to the session's invalid comment if it exists" do
      comment = mock_model('Comment')
      session[:invalid_comment] = comment
      session.should include :invalid_comment

      get_post

      assigns(:comment).should be comment
    end

    it "should discard any invalid comments after using it" do
      comment = mock_model('Comment')
      session[:invalid_comment] = comment

      get_post

      session[:invalid_comment].should be nil
    end

    it "should autofill comment fields when user is logged in" do
      current_user = FactoryGirl.create(:user)
      controller.stub(:current_user).and_return(current_user)

      get_post

      assigns(:comment).should be_a Comment
      comment = assigns(:comment)
      comment.username.should be current_user.username
      comment.email.should be current_user.email
    end
  end

end
