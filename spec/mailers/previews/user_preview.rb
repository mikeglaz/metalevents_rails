# Preview all emails at http://localhost:3000/rails/mailers/user
class UserPreview < ActionMailer::Preview
  def activation_email
    user = User.first
    user.activation_token = User.new_token
    UserMailer.activation_email(user)
  end

  def password_reset_email
    user = User.first
    user.password_reset_token = User.new_token
    PasswordResetMailer.password_reset_email(user)
  end
end
