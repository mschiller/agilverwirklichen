module CacheHelper
  include Cell::Caching::Notifications

  def get_last_updated_at_for(klass)
    klass.order("updated_at DESC").limit(1).first.updated_at.to_s
  end
end
