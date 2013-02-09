require 'spec_helper'

describe "Comment Creation" do

  let(:post) { FactoryGirl.create(:post) }

  pending "allows user to comment on a blog post" do
    visit blog_permalink_path(:category => post.category.name, :slug => post.slug)

    fill_in 'comment_username', :with => 'John Smith'
    fill_in 'comment_email', :with => 'user@gmail.com'
    fill_in 'comment_comment', :with => 'lorem new comment ipsum'

    click_button 'Submit'

    page.should have_content 'lorem new comment ipsum'
    page.should have_content 'posted by: John Smith'
  end

end
