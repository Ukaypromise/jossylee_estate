class ApplicationController < ActionController::Base
  include Pundit::Authorization

  before_action :set_render_order
  before_action :initialize_order
  # after_action :verify_authorized, except: :index
  # after_action :verify_policy_scoped, only: :index
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore
    flash[:alert] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
    redirect_to(request.referer || root_path)
  end

  protect_from_forgery with: :exception
  before_action :update_allowed_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def set_render_order
    @render_order = true
  end

  def initialize_order
    @order ||= Order.find_by(id: session[:order_id])

    if @order.nil?
      @order = Order.create
      session[:order_id] = @order.id
    end
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:email, :first_name, :last_name, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:email, :first_name, :last_name, :password, :password_confirmation, :current_password)
    end
  end

  def after_sign_in_path_for(_resource_or_scope)
    root_path
  end
end
