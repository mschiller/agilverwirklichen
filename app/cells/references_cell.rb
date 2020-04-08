class ReferencesCell < Cell::ViewModel
  include ActionController::MobileFu::InstanceMethods
  include PictureTag::ViewHelpers
  include ApplicationHelper
  include CacheHelper

  cache :show, expires_in: ::Rails.configuration.cache_default_time_in_minutes.to_i.minutes do
    ["references_cell", get_last_updated_at_for(Reference)]
  end

  def show
    @references = Reference.live
    render
  end
end
