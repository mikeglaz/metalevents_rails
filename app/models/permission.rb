class Permission
  attr_reader :user

  def initialize(user = nil)
    @user = user
  end

  def allow?(controller, action)
    return true if controller == 'sessions' || controller == 'account_activation' || controller == 'password_reset'
    return true if controller == 'users' && action.in?(%w[new create])
    return true if controller == 'events' && action.in?(%w[index show])

    if user
      return true if controller == 'users' && action.in?(%w[edit update show])
      return true if controller == 'events' && action != 'destroy'
      return true if user.admin?
    end

    false
  end
end
