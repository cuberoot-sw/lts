class LeaveMailer < ActionMailer::Base
  default from: "from@example.com"

  def leave_email(leave)
    @leave = leave
    content_type  "multipart/alternative"
  end
    #mail(:to => admin@cuberoot.com,
     #    :subject => "Application for leave")
end
