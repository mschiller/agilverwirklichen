class Reference < ApplicationRecord
  im_config = "-strip -interlace Plane -quality 80" # -posterize 3

  has_attached_file :photo, styles: { small: "48x48<", medium: "250x250<", large: "500x500<" },
                            default_url: "default_images/:style/photo.jpg", :convert_options => { small: im_config, medium: im_config, large: im_config, huge: im_config }

  attr_accessor :delete_photo

  before_save { self.photo = nil if self.delete_photo == "1" }
  before_save { self.released_at = DateTime.now if self.released_at == nil }

  validates_attachment_size :photo, less_than: 5.megabytes
  validates_attachment_content_type :photo, content_type: ["image/jpeg", "image/png"]

  scope :live, -> { where(live: true) }
end
