module RescueMethods
  extend ActiveSupport::Concern

  included do
    rescue_from Exception do |exception|
      if exception.class == CanCan::AccessDenied
        if signed_in?
          redirect_to main_app.root_path, alert: exception.message
        else
          redirect_to new_user_session_path, alert: exception.message
        end
      elsif exception.class == Mime::Type::InvalidMimeType
        render cms_page: '/404'
      elsif exception.class == ActionController::UnknownFormat
        render cms_page: '/404'
      elsif exception.class == ActiveRecord::RecordNotFound
        render cms_page: '/404'
      elsif exception.class == ActionController::InvalidAuthenticityToken
        render cms_page: '/404'
      elsif exception.class == ActionController::InvalidCrossOriginRequest
        render cms_page: '/404'
      else
        render cms_page: '/500'
      end
      ExceptionNotifier.notify_exception(
        exception,
        env: request.env, data: {message: 'was doing something wrong'}
      )
    end
  end
end
