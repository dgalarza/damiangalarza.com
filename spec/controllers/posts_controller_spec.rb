require 'spec_helper'

describe PostsController do

  describe "Routes" do

    it "should route to post by date and post slug" do
      assert_routing("/posts/2011/1/25/post-title", :controller => 'posts', :action => 'show', :year => '2011', :month => '1', :day => '25', :slug => 'post-title')
    end

  end

end
