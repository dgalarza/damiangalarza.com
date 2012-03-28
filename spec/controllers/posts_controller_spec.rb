require 'spec_helper'

describe PostsController do

  describe "Routes" do

    it "should route to post by category and post slug" do
      assert_routing("/posts/javascript/post-title", :controller => 'posts', :action => 'show', :method => :get, :category => 'javascript', :slug => 'post-title')
    end

  end

end
