# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :body, presence: true
  validates :score, presence: true
end
