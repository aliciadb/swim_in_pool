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

<<<<<<< HEAD
  def resolve
    scope.all
=======
  def edit
    @record.user == @user
>>>>>>> ef901722734dc813aedd7c16ceea7e964ffe9c92
  end
end
