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

    if user
      allow :users, [:edit, :update, :show]
      allow :events, [:new, :create, :edit, :update]
      allow_all if user.admin?
    end
  end


  def allow(controller, actions)
    @allowed_actions ||= {}

    if @allowed_actions[controller]

      actions.each do |action|
        @allowed_actions[controller].merge!({ action => true})
      end
    else
      @allowed_actions[controller] = Hash[actions.map { |action| [action, true]}]
    end
  end

  def allow_all
    @allow_all = true
  end

  def allowed?(controller, action=nil)
    @allow_all || @allowed_actions[controller][action]
  end
end




