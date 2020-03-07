class Role < ActiveRecord::Base
  has_many :roles_users, dependent: :destroy
  has_many :users, through: :roles_users

  has_paper_trail

  validates :name, presence: true, uniqueness: true
end
