module UserRolesModule
  extend ActiveSupport::Concern

  included do
    has_many :roles_users, dependent: :destroy
    has_many :roles, through: :roles_users

    def role_symbols
      @role_symbols ||= (roles || []).map { |r| r.name.to_sym }
    end

    def has_role?(role_sym)
      roles.any? { |r| r.name.underscore.to_sym == role_sym }
    end

    def admin?
      has_role? :admin
    end

    def moderator?
      has_role? :moderator
    end
  end

  module ClassMethods
  end
end
