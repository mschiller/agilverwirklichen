module UserDeviseModule
  extend ActiveSupport::Concern

  included do
    devise :database_authenticatable, :recoverable, :registerable,
           :rememberable, :trackable, :validatable, :confirmable, :lockable
  end
end
