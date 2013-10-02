class CommentMailer < ActionMailer::Base
  default from: "comments@damiangalarza.com"

  def comment_notification(comment)
    @comment = comment
    mail(:to => 'damian@damiangalarza.com', :subject => 'New Comment Received')
  end
end
