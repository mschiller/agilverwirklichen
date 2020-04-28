class User < ApplicationRecord
  include UserDeviseModule
  include UserRolesModule
  extend FriendlyId

  friendly_id :id_and_username, use: :slugged

  has_rich_text :about

  has_paper_trail

  validates :password, confirmation: true
  validates :email, presence: true, email: true

  has_one_attached :avatar
  attr_accessor :remove_avatar

  validates :avatar, content_type: [:png, :jpg, :jpeg],
                     size: { less_than: 10.megabytes, message: "hat nicht die passende Größe, da es größer als 10 MB ist" },
                     dimension: { width: { min: 150, max: 6000 },
                                  height: { min: 150, max: 6000 }, message: "hat nicht die passende Größe von 150px bis 6000px" }

  after_save do
    avatar.purge if remove_avatar == "1"
  end

  def name
    self.email
  end

  def age
    Time.now.to_date - self.birthday.to_date
  end

  private

  def id_and_username
    "#{id}-#{username}"
  end

  rails_admin do
    navigation_icon "icon-user"

    field :roles
    field :first_name
    field :surname
    field :email

    list do
    end

    edit do
      field :avatar, :active_storage
      field :about
    end
  end
end
