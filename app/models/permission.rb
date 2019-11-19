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
    # allow :users, [:new, :create]
    # allow :sessions, [:new, :create, :destroy]
    # allow :events, [:index, :show]

    if user
      # allow :users, [:edit, :update, :show]
      # allow :events, [:new, :create]
      allow :events, [:edit, :update] do |event|
        print 'Inside Block: '
        puts "action: #{event}"
        event.user_id == user.id
      end
      allow_all if user.admin?
    end

    # puts @allowed_actions
  end

  def allow?(controller, action=nil, resource=nil)
    # puts controller, action, resource
    # events, edit, #<Event:0x00005602362b78c8>
    allowed = @allow_all || @allowed_actions[controller][action]

    # puts @allowed_actions

    # if resource
    #   allowed.call(resource)
    # end
  end

  def allow_all
    @allow_all = true
  end

  def allow(controller, actions, &block)
    p controller, actions
    p block
    @allowed_actions ||= {}

    if @allowed_actions[controller]
      actions.each do |action|
        @allowed_actions[controller].merge!({ action => true})
      end
    else
      @allowed_actions[controller] = Hash[actions.map { |action| [action, true]}]
    end
  end

end




