class ListBookmarkPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def create?
    user == record.restaurant_list.user
  end

  def destroy?
    user == record.restaurant_list.user
  end
end
