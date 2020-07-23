# frozen_string_literal: true

class Review < ApplicationRecord
  THUMBS_DOWN = -1
  THUMBS_UP = 1
  STAR = 2

  SCORES = [THUMBS_DOWN, 0, THUMBS_UP, STAR].freeze

  belongs_to :user
  belongs_to :game

  validates :score,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: THUMBS_DOWN, less_than_or_equal_to: STAR }

  scope :stars, -> { where(score: 2) }
  scope :up, -> { where(score: 1) }
  scope :down, -> { where(score: -1) }
end
