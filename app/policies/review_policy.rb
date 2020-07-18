# frozen_string_literal: true

class ReviewPolicy < ApplicationPolicy
  def create?
    record.user == user
  end

  def update?
    record.user == user
  end
end
