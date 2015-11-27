class UserMailer < ApplicationMailer
  
  def deleted_user_email(user)
    @user = user
    mail(to: @user.email, subject: "Your account with Rotten Mangoes has been deleted.")
  end

end