class GroupPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.joins(:users).where(group_members: { user: user }).distinct.order(id: :desc)
    end
  end

  def show?
    record.users.include?(user)
  end

  def create?
    true
  end

  def update?
    record.admins.include?(user)
  end

  def destroy?
    record.admins.include?(user)
  end
end
