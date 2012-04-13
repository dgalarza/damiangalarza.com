require "spec_helper"

describe CommentMailer do

  describe "Comment Notification" do
    let (:comment) { FactoryGirl.create(:comment) }
    let (:mail) { CommentMailer.comment_notification(comment) }

    it "should have a subject of Comment Received" do
      mail.should have_subject /Comment Received/
    end

    specify "body should include comment" do
      mail.should have_body_text /#{comment.comment}/
    end

    specify "body should include the author" do
      mail.should have_body_text /#{comment.username}/
    end
  end

end
