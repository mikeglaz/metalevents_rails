class UserMailer < ApplicationMailer
  default from: 'no-reply@metalivents.com'

  def activation_email(user)
    @user = user
    mail(to: @user.email, subject: 'Activate Account')
  end

  def password_reset_email(user)
    @user = user
    mail(to: @user.email, subject: 'Password Reset')
  end
end
