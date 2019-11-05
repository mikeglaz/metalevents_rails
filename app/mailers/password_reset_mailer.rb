class PasswordResetMailer < ApplicationMailer
  default from: 'no-reply@metalivents.com'

  def password_reset_email(user)
    @user = user
    mail(to: @user.email, subject: 'Password Reset')
  end
end
