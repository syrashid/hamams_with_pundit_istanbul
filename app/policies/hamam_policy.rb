class HamamPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    user
  end

  def update?
    # Only the record owner can edit
    user == record.user || user.admin?
    # Is equal to user = @hamam.user
  end

  def destroy?
    update?
  end
end
