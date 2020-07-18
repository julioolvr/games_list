# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :body, presence: true
  validates :score,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: -1, less_than_or_equal_to: 2 }
end
