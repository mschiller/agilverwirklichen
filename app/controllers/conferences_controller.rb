class ConferencesController < InheritedResources::Base
  layout "classroom", only: [:classroom]

  before_action :set_referer, only: [:classroom]
  before_action :authenticate_user!

  def classroom
  end

  private

  def conference_params
    params.require(:conference).permit(:room, :name, :password)
  end

  def set_referer
    session[:referer] = '/klassenraum'
  end
end
