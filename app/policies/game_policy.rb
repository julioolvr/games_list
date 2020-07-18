# frozen_string_literal: true

class GamePolicy < ApplicationPolicy
  def create?
    user.group == record.group
  end

  def show?
    user.group == record.group
  end

  def update?
    user.group == record.group
  end

  def destroy?
    user.group == record.group
  end

  class Scope < Scope
    def resolve
      scope.where(group: user.group)
    end
  end
end
