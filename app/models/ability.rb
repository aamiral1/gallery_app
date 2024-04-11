# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user

    if @user.present?
      can :manage, Gallery
    else
      can :read, Gallery
    end
  end
end
