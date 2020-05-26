class RestaurantPolicy < ApplicationPolicy
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
    record.user == user
  end

  def destroy?
    update?
  end
end

# access to 2 things
# record => whatever you authorized
# user => current_user from devise
