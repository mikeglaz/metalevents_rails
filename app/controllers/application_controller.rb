class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :authorize
  delegate :allow?, to: :current_permission
  helper_method :allow?

  def current_permission
    @current_permission ||= Permission.new(current_user)
  end

  def current_resource
    nil
  end

  def authorize
    if !current_permission.allow?(params[:controller], params[:action], current_resource)
      flash[:danger] = 'Not authorized.'
      redirect_to root_path
    end
  end
end
