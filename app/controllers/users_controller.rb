class UsersController < ApplicationController
  before_action :user_signed_in, only: [:edit, :update, :destroy]
  before_action :admin_user, only: :destroy

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      UserMailer.activation_email(@user).deliver_now
      flash[:info] = "Thank you for registering! An activation email has been sent."
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "Deleted user #{@user.name}"
    redirect_to users_path
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def user_signed_in
      unless signed_in?
        flash[:danger] = "Please sign in"
        redirect_to sign_in_path
      end
    end



    def admin_user
      redirect_to root_path unless current_user.admin?
    end


end
