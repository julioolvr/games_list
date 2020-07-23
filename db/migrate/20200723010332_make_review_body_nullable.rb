# frozen_string_literal: true

class MakeReviewBodyNullable < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:reviews, :body, true)
  end
end
