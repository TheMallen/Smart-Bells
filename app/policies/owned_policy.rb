class OwnedPolicy < ApplicationPolicy
  def show?
    true
  end

  def create?
    true
  end

  def update?
    true if record.user.id == user.id
  end

  def destroy?
    true if record.user.id == user.id
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end
end
