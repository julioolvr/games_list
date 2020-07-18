# frozen_string_literal: true

class Game < ApplicationRecord
  has_and_belongs_to_many :platforms
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :platforms, presence: true
end
