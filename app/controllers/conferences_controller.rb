class ConferencesController < InheritedResources::Base
  layout "classroom", only: [:classroom]

  before_action :set_classroom_referer, only: [:classroom]
  before_action :authenticate_user!, :if => proc {params[:auth] }

  def classroom
  end

  private

  def conference_params
    params.require(:conference).permit(:room, :name, :password)
  end

  def set_classroom_referer
    session[:classroom_referer] = true
  end
end
