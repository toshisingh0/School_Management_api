class SchoolPolicy < ApplicationPolicy
  def create?
    user.admin?
  end

  def update?
    user.school_admin?
  end

  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
