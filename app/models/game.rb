# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :group
  has_and_belongs_to_many :platforms
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :platforms, presence: true
end
