class UserMailer < ActionMailer::Base
  default from: "pansingh@weboniselab.com"

  def registration_confirmation(user)
    @user = user

    mail(:to => "#{user.username} <#{user.email}>", :subject => "Welcome to Project Management System" )
  end
end
