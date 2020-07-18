# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :set_review, only: %i[update]

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params.merge(user: current_user))

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review.game, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { redirect_to @review.game, alert: @review.errors.full_messages.join(', ') }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review.game, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { redirect_to @review.game, alert: @review.errors.full_messages.join(', ') }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_review
    # TODO: Use pundit to validate the user only has access to their own reviews
    @review = Review.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def review_params
    params.require(:review).permit(:body, :score, :game_id)
  end
end
