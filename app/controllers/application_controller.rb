class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  # before_action :authorize
  delegate :allowed?, to: :current_permission
  helper_method :allowed?

  def current_permission
    @current_permission ||= Permission.new(current_user)
  end


  def authorize
    if !current_permission.allowed?(params[:controller], params[:action])
      flash[:danger] = 'Not authorized.'
      redirect_to root_path
    end
  end
end
