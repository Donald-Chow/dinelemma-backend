class GroupMemberPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def create
    record.group.admins.include?(current_user)
  end

  def update
    record.group.admins.include?(current_user)
  end

  def destroy
    record.group.admins.include?(current_user) || record.user == current_user
  end
end
