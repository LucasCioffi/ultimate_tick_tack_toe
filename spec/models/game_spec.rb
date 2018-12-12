require 'rails_helper'

RSpec.describe Game, type: :model do
  it 'starts without a winner' do
    game = Game.create
    expect(game.winner).to eq ''
  end

  it 'starts with X as the first player to move' do
    game = Game.create
    expect(game.turn).to eq 'X'
  end

  it 'starts with an empty 9x9 matrix for the board' do
    game = Game.create
    expect(game.board).to eq [
      ["", "", "", "", "", "", "", "", ""],
      ["", "", "", "", "", "", "", "", ""],
      ["", "", "", "", "", "", "", "", ""],
      ["", "", "", "", "", "", "", "", ""],
      ["", "", "", "", "", "", "", "", ""],
      ["", "", "", "", "", "", "", "", ""],
      ["", "", "", "", "", "", "", "", ""],
      ["", "", "", "", "", "", "", "", ""],
      ["", "", "", "", "", "", "", "", ""]
    ]
  end

  it 'starts with 9 valid subgames' do
    game = Game.create
    expect(game.valid_subgames).to eq ['0', '1', '2', '3', '4', '5', '6', '7', '8']
  end
end
