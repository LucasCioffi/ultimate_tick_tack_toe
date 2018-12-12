class Api::V1::GamesController < ApplicationController
  before_action :set_game, only: [:show, :update]

  # GET /games/1
  def show
    if @game
      render json: @game
    else
      render json: { error: "Invalid id" }, status: 404
    end
  end

  # POST /game
  def create
    @game = Game.create
    render json: @game, status: :created
  end

  # PATCH/PUT /move
  def update
    subgame = params[:subgame].to_i
    cell = params[:cell].to_i
    errors = error_message(subgame, cell)
    if errors.present?
      render json: { message: errors }, status: 400
    else
      board = @game.board
      board[subgame][cell] = @game.turn
      @game.update_attributes(
        board: board,
        turn: next_turn,
        valid_subgames: calculate_subgames)
      render json: @game, status: 200
    end
  end

  private
    def calculate_subgames
      ['updated!']
    end

    def next_turn
      @game.turn == 'X' ? 'Y' : 'X'
    end

    def error_message(subgame, cell)
      return 'the cell is occupied' if @game.board[subgame][cell].present?
      return "it's an invalid move" if subgame < 0 || subgame > 8
      return "it's an invalid move" if cell < 0 || cell > 8
      return 'the game is over' if @game.winner.present?
      ''
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find_by(id: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def game_params
      params.require(:game).permit(:board, :winner, :turn, :valid_subgames)
    end
end
