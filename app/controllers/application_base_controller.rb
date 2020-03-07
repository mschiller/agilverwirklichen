class ApplicationBaseController < ActionController::Base
  include RescueMethods if Rails.env.production?

  protect_from_forgery with: :exception

  before_action do
    if current_user && current_user.has_role?(:developer)
      Rack::MiniProfiler.authorize_request
    end
  end

  protected

  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end
end
