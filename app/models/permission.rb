# class Permission
#   attr_reader :user

#   def initialize(user)
#     allow :users, [:new, :create]
#     allow :sessions, [:new, :create, :destroy]
#     allow :events, [:index, :show]

#     if user
#       allow :users, [:edit, :update, :show]
#       allow :events, [:new, :create, :edit, :update]
#       allow_all if user.admin?
#     end
#   end

#   # def allow?(controller, action)
#   #   return true if controller == 'sessions' || controller == 'account_activation' || controller == 'password_reset'
#   #   return true if controller == 'users' && action.in?(%w[new create])
#   #   return true if controller == 'events' && action.in?(%w[index show])

#   #   if user
#   #     return true if controller == 'users' && action.in?(%w[edit update show])
#   #     return true if controller == 'events' && action != 'destroy'
#   #     return true if user.admin?
#   #   end

#   #   false
#   # end

#   def allow?(controller, action)
#     @allow_all || @allowed_actions[[controller.to_s, action.to_s]]
#   end

#   def allow_all
#     @allow_all = true
#   end

#   def allow(controllers, actions)
#     @allowed_actions ||= {}

#     Array(controllers).each do |controller|
#       Array(actions).each do |action|
#         @allowed_actions[[controller.to_s, action.to_s]] = true
#       end
#     end
#   end
# end

class Permission
  def initialize(user)
    allow :users, [:new, :create]
    allow :sessions, [:new, :create, :destroy]
    allow :events, [:index, :show]
    allow :venues, [:index, :show]
    allow :calendar, [:show]
    allow :password_reset, [:new, :create, :edit, :update]

    if user
      allow :users, [:edit, :update, :show] do |u|
        u.id === user.id
      end
      allow :events, [:new, :create]
      allow :events, [:edit, :update] do |event|
        event.user_id == user.id
      end
      allow_all if user.admin?
    end
  end

  def allow?(controller, action=nil, resource=nil)
    allowed = @allow_all || @allowed_actions[controller.to_s][action.to_s]

    if allowed
      if allowed == true
        true
      elsif resource
        allowed.call(resource)
      else
        false
      end
    end
  end

  def allow_all
    @allow_all = true
  end

  def allow(controller, actions, &block)
    @allowed_actions ||= {}

    if @allowed_actions[controller.to_s]
      actions.each do |action|
        @allowed_actions[controller.to_s].merge!({ action.to_s => block || true})
      end
    else
      @allowed_actions[controller.to_s] = Hash[actions.map { |action| [action.to_s, block || true]}]
    end
  end

end




