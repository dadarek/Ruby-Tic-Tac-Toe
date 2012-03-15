require 'minimax_heuristic'
require 'board_utilities'

describe MinimaxHeuristic do
  before(:each) do
    @heuristic = MinimaxHeuristic.new
    @board = Board.new("x", "o")
  end

  it "knows there are zero ways of winning on last tie move" do
    take_x_o(@board, [1, 3, 4, 6], [2, 5, 7, 9])
    assert_wins_x(8, 0)
  end

  it "knows there is one way of winning on last winning move" do
    take_x_o(@board, [1, 2, 6, 7], [4, 5, 8, 9])
    assert_wins_x(3, 1)
  end

  def assert_wins_x(square, expected_wins)
    @heuristic.possible_wins(@board, "x", square).should == expected_wins
  end
end
