class PoolPolicy < ApplicationPolicy
  class Scope < Scope
    def create?
      true
    end
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
