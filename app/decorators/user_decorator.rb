class UserDecorator < Draper::Decorator
  include Webpacker::Helper
  include ActionView::Helpers::AssetUrlHelper
  include Rails.application.routes.url_helpers
  delegate_all

  def avatar_url
    if avatar.attached?
      variant = avatar.variant(resize: "100x100")
      return rails_representation_url(variant, only_path: true)
    else
      asset_pack_path 'media/images/defaults/user.png'
    end
  end
end
