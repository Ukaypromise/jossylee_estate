class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def list?
    user.role == "admin"
  end


  def promote_user?
    user.role == "admin"
  end
end
