module SessionsHelper
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def current_user?(user)
    user == current_user
  end

  def sign_in(user)
    session[:user_id] = user.id unless signed_in?
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    session[:user_id] = nil
    @current_user = nil
  end
end
