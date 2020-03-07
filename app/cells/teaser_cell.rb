class TeaserCell < Cell::ViewModel
  include ActionController::MobileFu::InstanceMethods
  include PictureTag::ViewHelpers
  include ApplicationHelper
  include CacheHelper

  cache :show, expires_in: ::Rails.configuration.cache_default_time_in_minutes.to_i.minutes do
    ['teaser_cell', get_last_updated_at_for(Teaser)]
  end

  def show
    @teasers = Teaser.live
    render
  end
end
