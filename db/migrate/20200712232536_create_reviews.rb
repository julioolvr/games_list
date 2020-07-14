# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.text :body
      t.integer :score

      t.timestamps
    end
  end
end
