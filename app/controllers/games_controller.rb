# frozen_string_literal: true

class GamesController < ApplicationController
  before_action :set_game, only: %i[show edit update destroy]

  # GET /games
  # GET /games.json
  def index
    @q = Game.ransack(params[:q])
    @q.sorts = 'rating desc' if @q.sorts.empty?
    @games = policy_scope(@q.result)
  end

  # GET /games/1
  # GET /games/1.json
  def show
    all_reviews = @game.reviews
    @own_review = all_reviews.find_by(user: current_user) || Review.new(game: @game)
    @other_reviews = all_reviews - [@own_review]
  end

  # GET /games/new
  def new
    @game = Game.new(group: current_user.group)
    authorize @game
  end

  # GET /games/1/edit
  def edit; end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params.merge(group: current_user.group))
    authorize @game

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = Game.find(params[:id])
    authorize @game
  end

  # Only allow a list of trusted parameters through.
  def game_params
    params.require(:game).permit(:name, platform_ids: [])
  end
end
