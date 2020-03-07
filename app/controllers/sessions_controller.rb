class SessionsController < Devise::SessionsController
  def new
    store_location_for(:user, request.referer)
    super
  end
end