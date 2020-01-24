class AccountActivationController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])

    if user && user.authenticated?(:activation_digest, params[:token])
      user.update_attribute(:activated, true)
      # sign_in(user)
      flash[:success] = "Your account has been activated! You may now log in."
      redirect_to root_path
    else
      flash[:danger] = "Invalid activation token"
      redirect_to root_path
    end
  end

end
