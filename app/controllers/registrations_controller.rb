class RegistrationsController < Devise::RegistrationsController
  #prepend_before_action :check_captcha, only: [:create]

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def after_update_path_for(resource)
    profile_path(resource)
  end

  private
  
  # def check_captcha
  #   unless verify_rucaptcha?
  #     self.resource = resource_class.new sign_up_params
  #     resource.validate
  #     set_minimum_password_length
  #     set_flash_message!(:notice, :check_captcha)
  #     respond_with_navigational(resource) { render :new }
  #   end 
  # end

  def sign_up_params
    params.require(:user).permit(:first_name, :surname, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :surname, :email, :avatar, :remove_avatar)
  end
end
