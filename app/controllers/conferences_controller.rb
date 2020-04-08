class ConferencesController < InheritedResources::Base
  private

  def conference_params
    params.require(:conference).permit(:room, :name, :password)
  end
end
