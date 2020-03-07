class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user (not logged in)

    can :read, :all

    if user.admin?
      can :manage, :all
      can :access, :admin
      can :history, :admin
      can :show_in_app, :admin
    end

    if user.has_role? :team
    end
  end
end
