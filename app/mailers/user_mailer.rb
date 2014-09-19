class UserMailer < ActionMailer::Base
  default from: "notifications@example.com"

  def bookmark_email(user, bookmark)
    @bookmark = bookmark
    @user = user
    #@url = 'http://example.com/login'
    mail to: user.email, subject: 'You have saved a new bookmark'
  end


end
