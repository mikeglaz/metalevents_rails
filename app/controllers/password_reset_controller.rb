class PasswordResetController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email])

    if @user
      @user.reset_password
      @user.send_reset_password_email
      flash[:info] = 'A password reset email has been sent'
      redirect_to root_path
    else
      flash.now[:danger] = 'Email not found'
      render :new
    end
  end

  def edit
    @user = User.find_by(email: params[:email])

    unless @user && @user.authenticated?(:password_reset_digest, params[:id])
      flash[:danger] = "Invalid reset token"
      redirect_to sign_in_path
    end
  end

  def update
    @user = User.find_by(email: params[:email])

    if @user.update_attributes(user_params)
      flash[:success] = 'Password updated!'
      redirect_to sign_in_path
    else
      render :edit
    end
  end

  private

    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end
end
