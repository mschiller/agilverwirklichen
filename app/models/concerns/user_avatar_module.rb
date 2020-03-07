module UserAvatarModule
  extend ActiveSupport::Concern

  included do
    has_one_attached :avatar
    attr_accessor :remove_avatar

    validates :avatar, attached: true, content_type: [:png, :jpg, :jpeg],
                                     size: { less_than: 10.megabytes , message: 'hat nicht die passende Größe, da es größer als 10 MB ist' },
                                     dimension: { width: { min: 150, max: 6000 },
                                                  height: { min: 150, max: 6000 }, message: 'hat nicht die passende Größe von 150px bis 6000px' }

    after_save do
      avatar.purge if remove_avatar == '1'
    end
  end
end
