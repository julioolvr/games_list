# frozen_string_literal: true

class Platform < ApplicationRecord
  has_and_belongs_to_many :games
end
