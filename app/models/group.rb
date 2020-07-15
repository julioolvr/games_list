# frozen_string_literal: true

class Group < ApplicationRecord
  has_many :users, dependent: :destroy
end
