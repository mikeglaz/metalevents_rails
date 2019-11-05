class SessionsController < ApplicationController
  before_action :not_signed_in, only: [:new]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])

    if user && user.authenticate(params[:session][:password])
      if user.activated?
        sign_in(user)
        flash[:success] = 'Signed in successfully.'
        redirect_to user
      else
        flash[:danger] = 'Your account has not yet been activated.'
        redirect_to root_path
      end
    else
      flash.now[:danger] = 'Invalid email and/or password.'
      render :new
    end
  end

  def destroy
    sign_out
    flash[:success] = 'Signed out successfully.'
    redirect_to root_path
  end

  def not_signed_in
    if signed_in?
      flash[:info] = 'You are already signed in.'
      redirect_to root_path
    end
  end
end
