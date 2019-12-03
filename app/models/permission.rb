class Permission
  def initialize(user)
    allow :users, [:new, :create]
    allow :sessions, [:new, :create, :destroy]
    allow :events, [:index, :show]
    allow :venues, [:index, :show]
    allow :calendar, [:show]
    allow :password_reset, [:new, :create, :edit, :update]
    allow :account_activation, [:edit]

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




