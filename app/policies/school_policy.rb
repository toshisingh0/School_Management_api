class SchoolPolicy < ApplicationPolicy
  def create?
    user.role == "admin"  # only admin can create
  end

  def update?
    user.role == "school_admin"
  end


  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
