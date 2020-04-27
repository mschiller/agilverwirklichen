class Reference < ApplicationRecord
  has_one_attached :photo
  attr_accessor :remove_photo

  validates :photo, attached: true, content_type: [:png, :jpg, :jpeg],
                    size: { less_than: 10.megabytes, message: "hat nicht die passende Größe, da es größer als 10 MB ist" },
                    dimension: { width: { min: 150, max: 6000 },
                                 height: { min: 150, max: 6000 }, message: "hat nicht die passende Größe von 150px bis 6000px" }

  after_save do
    photo.purge if remove_photo == "1"
  end

  before_save { self.released_at = DateTime.now if self.released_at == nil }

  scope :live, -> { where(live: true) }

  # rails_admin do

  #   field :name
  #   field :live
  #   field :position
  #   field :company
  #   field :released_at

  #   list do
  #   end

  #   edit do
  #     field :html
  #     field :photo, :active_storage
  #   end
  # end
end
