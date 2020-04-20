class SessionsController < Devise::SessionsController
  def new

    if session[:classroom_referer]
      @default_user_email = Figaro.env.default_class_email_address
      session[:classroom_referer] = nil
    end

    store_location_for(:user, request.referer)
    super
  end
end