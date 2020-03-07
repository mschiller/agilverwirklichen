class User < ActiveRecord::Base
  include UserDeviseModule
  include UserAvatarModule
  include UserRolesModule
  extend FriendlyId

  friendly_id :id_and_username, use: :slugged

  has_paper_trail

  validates :password, confirmation: true
  validates :email, presence: true, email: true

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
end
