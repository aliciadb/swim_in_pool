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

  def show?
    true
  end

  def resolve
    scope.all
  end

  def edit?
    @record.user == @user
  end

  def update?
    @record.user == @user
  end

  def destroy?
    @record.user == @user
  end
end
