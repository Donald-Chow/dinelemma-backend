class RestaurantListPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user:).order(created_at: :desc)
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    user == record.user
  end

  def destroy?
    user == recrod.user
  end
end
