class RolesUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :role

  validates :user_id, :role_id, presence: true
  validates :user_id, uniqueness: {scope: :role_id}
end
