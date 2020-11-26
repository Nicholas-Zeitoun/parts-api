class StatisticPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def update?
    # make sure the person updating is the person who made
    true
  end

  def create?
    user.present?
  end

  def destroy?
    update?
  end

  private

  # def user_is_owner?
  #   record.user == user
  # end
end
