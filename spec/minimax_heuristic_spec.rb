require 'minimax_heuristic'
require 'board_utilities'

describe MinimaxHeuristic do
  it "values tying squares as 0" do
    heuristic = MinimaxHeuristic.new
    board = Board.new("x", "o")
  end
end
