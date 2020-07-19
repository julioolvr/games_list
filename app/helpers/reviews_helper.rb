# frozen_string_literal: true

module ReviewsHelper
  def score_icon(score)
    case score
    when Review::THUMBS_DOWN
      '👎'
    when Review::THUMBS_UP
      '👍'
    when Review::STAR
      '⭐️'
    end
  end
end
