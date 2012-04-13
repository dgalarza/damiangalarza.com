require 'spec_helper'

describe Comment do
  include EmailSpec::Helpers
  include EmailSpec::Matchers

  it "should notify admin of new approved comments" do
    comment = FactoryGirl.build(:comment)
    mailer = double('mailer')
    mailer.stub(:deliver)

    CommentMailer.should_receive(:comment_notification).with(comment).and_return(mailer)
    comment.save
  end

  it "should not notify of known spam comments" do
    comment = FactoryGirl.build(:comment, :approved => false)
    comment.stub(:check_for_spam).and_return(true)

    CommentMailer.should_not_receive(:comment_notification)
    comment.save
  end

end
