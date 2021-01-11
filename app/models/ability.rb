# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
      if user.host?
        can :scan, :all
      else
        can :read, :all
      end
  end
end
