require 'minimax_heuristic'
require 'board_utilities'
require 'board'

describe MinimaxHeuristic do
  before(:each) do
    @heuristic = MinimaxHeuristic.new
    @board = Board.new("x", "o")
  end

  it "knows all winning combinations" do
    MinimaxHeuristicHelper.won?([1, 2, 3]).should == true
    MinimaxHeuristicHelper.won?([4, 5, 6]).should == true
    MinimaxHeuristicHelper.won?([7, 8, 9]).should == true
    MinimaxHeuristicHelper.won?([1, 4, 7]).should == true
    MinimaxHeuristicHelper.won?([2, 5, 8]).should == true
    MinimaxHeuristicHelper.won?([3, 6, 9]).should == true
    MinimaxHeuristicHelper.won?([1, 5, 9]).should == true
    MinimaxHeuristicHelper.won?([3, 5, 7]).should == true
  end

  it "scores winning square as 1" do
    assert_value_of_next_square([1, 3, 5, 8], [2, 4, 6, 7], 9, 1)
  end

  it "scores final netural square as 0" do
    assert_value_of_next_square([4, 6, 7, 9], [1, 3, 5, 8], 9, 0)
  end

  it "scores a losing second-to-last move as -1" do
    assert_value_of_next_square([2, 4, 7], [1, 3, 5, 8], 6, -1)
  end
  
  it "scores a guaranteed-tie second-to-last move as 0" do
    assert_value_of_next_square([2, 4, 7], [1, 3, 5, 8], 9, 0)
  end

  it "scores a guaranteed-win third-to-last move as 1" do
    assert_value_of_next_square([1, 7, 8], [2, 4, 5], 9, 1)
  end

  it "scores a possible-win third-to-last move as 0" do
    assert_value_of_next_square([1, 7, 8], [2, 4, 5], 6, 0)
  end

  it "scores a guaranteed-loss third-to-last move as -1" do
    assert_value_of_next_square([2, 4, 7], [1, 3, 5], 6, -1)
  end

  it "scores a one-possible-win third-to-last move as 0" do
    assert_value_of_next_square([2, 4, 7], [1, 3, 5], 9, 0)
  end

  it "scores a one-possible-win one-guaranteed-loss third-to-last move as -1" do
    assert_value_of_next_square([2, 4, 7], [1, 3, 5], 8, -1)
  end

  it "selects the correct (non-winning) next move" do
    take_x_o(@board, [2, 4, 7], [1, 3, 5])
    @heuristic.next_move(@board, "x").should == 9
  end

  it "selects the correct (winning) next move" do
    take_x_o(@board, [1, 2], [4, 5])
    @heuristic.next_move(@board, "x").should == 3
  end

  it "makes the correct first move" do
    @heuristic.next_move(@board, "x").should == 1
  end

  def assert_value_of_next_square(player, opponent, next_square, expected_value)
    helper = MinimaxHeuristicHelper.new(player, opponent)
    helper.value?(next_square).should == expected_value
  end
end
