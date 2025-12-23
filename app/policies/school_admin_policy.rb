class SchoolAdminPolicy < ApplicationPolicy

  # Only ADMIN can create school admins
  def create?
    user.present? && user.admin?
  end

  def update?
    user.present? && (user.admin? || user.school_admin?)
  end

  def destroy?
    user.present? && user.admin?
  end

  class Scope < Scope
    def resolve
      if user&.admin?
        scope.all
      elsif user&.school_admin?
        scope.where(id: user.id)
      else
        scope.none
      end
    end
  end
end
