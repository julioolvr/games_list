# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :group
  has_and_belongs_to_many :platforms
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :platforms, presence: true

  scope :sort_by_rating_desc, -> { joins(:reviews).group(:id).order('SUM(score) DESC') }
  scope :sort_by_rating_asc, -> { joins(:reviews).group(:id).order('SUM(score) ASC') }
end
