class BreadcrumbCell < Cell::ViewModel
  include ActionController::MobileFu::InstanceMethods
  include ApplicationHelper
  include CacheHelper
  include Escaped

  cache :show, expires_in: ::Rails.configuration.cache_default_time_in_minutes.to_i.minutes do
    ["breadcrumb_cell", request.path, get_last_updated_at_for(::Comfy::Cms::Page)]
  end

  def show(options = {})
    @title = options[:title]
    render
  end
end
