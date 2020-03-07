module StrongParameterMethods
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters, if: :devise_controller?

    def permitted_params
      @permitted_params ||= PermittedParams.new(params, current_user)
    end
    helper_method :permitted_params

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :password_confirmation, :remember_me, :avatar, :birthday, :roles])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :remember_me, :avatar, :birthday, :roles])
      devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :remember_me, :avatar, :birthday, :roles])
    end

    private

    def admin_path?
      controller_path =~ /admin/
    end
  end
end






