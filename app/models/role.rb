class Role < ApplicationRecord
  has_many :roles_users, dependent: :destroy
  has_many :users, through: :roles_users

  has_paper_trail

  validates :name, presence: true, uniqueness: true

  rails_admin do
    visible true
    parent User

    list do
      field :name
      field :label
    end
  end
end
