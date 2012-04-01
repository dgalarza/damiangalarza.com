require 'spec_helper'

describe Admin::PostsController do

  describe 'Editing' do

    before do
      @post = FactoryGirl.create(:post)
      controller.stub(:authenticate_user!).and_return(true)
      controller.stub(:authorize!).and_return(true)
    end

    specify "save_and_continue? should be true if using Save and Continue button" do
      post :update, :id => @post.id, :commit => 'Save and Continue'
      controller.save_and_continue?.should be true
    end

    it "should redirect back to edit when selecting save and continue" do
      post :update, :id => @post.id, :commit => 'Save and Continue'
      response.should redirect_to edit_admin_post_path(@post)
    end

    it "should redirect to posts index when not using save and continue" do
      post :update, :id => @post.id
      response.should redirect_to :admin_posts
    end

  end

end
