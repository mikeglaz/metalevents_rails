class Permission
  attr_reader :user

  def initialize(user = nil)
    @user = user
  end

  def allow?(controller, action)
    if user.nil?
      controller == 'events' && action.in?(%w[index show]) ||
      controller == 'sessions'
    elsif user.admin?
      true
    else
      controller == 'events' && action != 'destroy' ||
      controller == 'sessions'
    end
  end
end
