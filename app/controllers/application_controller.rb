class ApplicationController < ApplicationBaseController
  include ActionController::MobileFu
  include StrongParameterMethods
  include PaperTrailMethods
  include AjaxFlashMethods
  include CacheHelper

  has_mobile_fu false

  helper :all
  respond_to :html

  def self.default_url_options
    { locale: I18n.locale }
  end

  protected

  def after_sign_in_path_for(resource)
    session_referer = session[:referer]
    session[:referer] = nil
    stored_location_for(resource) || session_referer || root_path
  end

  def user_for_paper_trail
    user_signed_in? ? current_user.id : "Public user"
  end

  private

  def set_current_user
    User.current_user = current_user
  end
end
