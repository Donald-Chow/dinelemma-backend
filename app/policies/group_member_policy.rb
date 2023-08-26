class GroupMemberPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def create?
    record.group.admins.include?(user)
  end

  def update?
    record.group.admins.include?(user)
  end

  def destroy?
    record.group.admins.include?(user) || record.user == user
  end
end
