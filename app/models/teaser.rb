class Teaser < ApplicationRecord
  im_config = "-strip -interlace Plane -quality 80" # -posterize 3

  has_attached_file :image, styles: { small: "480x102<", medium: "1012x216<", large: "1280x273<", huge: "1600x342<" }, default_url: "default_images/:style/teaser.jpg", :convert_options => { small: im_config, medium: im_config,
                                                                                                                                                                                             large: im_config, huge: im_config }

  attr_accessor :delete_image
  before_save { self.image = nil if self.delete_image == "1" }

  validates_attachment_size :image, less_than: 5.megabytes
  validates_attachment_content_type :image, content_type: ["image/jpeg", "image/png"]

  scope :live, -> { where(live: true) }
end
