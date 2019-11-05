class Permission
  attr_reader :user

  def initialize(user = nil)
    @user = user
  end

  def allow?(controller, action)
    if user.nil?
      controller == 'events' && action.in?(%w[index show]) ||
      controller == 'sessions' ||
      controller == 'users' && action.in?(%w[new create]) ||
      controller == 'password_reset'
    elsif user.admin?
      true
    else
      controller == 'events' && action != 'destroy' ||
      controller == 'sessions' ||
      controller == 'account_activation' ||
      controller == 'users' && action.in?(%w[new create show])
    end
  end
end
