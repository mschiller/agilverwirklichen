class ConferencesController < InheritedResources::Base
  layout "classroom", only: [:classroom]

  #before_action :authenticate_user!

  def classroom
  end

  private

  def conference_params
    params.require(:conference).permit(:room, :name, :password)
  end
end
