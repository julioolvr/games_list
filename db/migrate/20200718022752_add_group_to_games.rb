# frozen_string_literal: true

class AddGroupToGames < ActiveRecord::Migration[6.0]
  def change
    add_reference :games, :group, null: false, foreign_key: true
  end
end
