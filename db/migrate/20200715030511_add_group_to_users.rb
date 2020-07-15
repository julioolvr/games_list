# frozen_string_literal: true

class AddGroupToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :group, null: false, foreign_key: true
  end
end
