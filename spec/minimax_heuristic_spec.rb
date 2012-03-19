require 'minimax_heuristic'
require 'minimax_heuristic_helper'
require 'board_utilities'
require 'board'

describe MinimaxHeuristic do
  before(:each) do
    @heuristic = MinimaxHeuristic.new
    @board = Board.new("x", "o")
    @helper = MinimaxHeuristicHelper.new(@board, "x")
  end

  it "scores tie as 0" do
    assert_score([1, 3, 4, 6, 8], [2, 5, 7, 9], 0)
  end

  it "scores wins as 1 and losses as -1" do
    assert_win_loss([1, 2, 3], [4, 5])
    assert_win_loss([4, 5, 6], [7, 8])
    assert_win_loss([7, 8, 9], [1, 2])
    assert_win_loss([1, 4, 7], [2, 3])
    assert_win_loss([2, 5, 8], [1, 3])
    assert_win_loss([3, 6, 9], [1, 2])
    assert_win_loss([1, 5, 9], [2, 3])
    assert_win_loss([3, 5, 7], [1, 2])
  end

  it "scores winning square as 1" do
    @helper.score_if_takes_square([1, 3, 5, 8], [2, 4, 6, 7], 9).should == 1
  end

  it "scores final netural square as 0" do
    @helper.score_if_takes_square([4, 6, 7, 9], [1, 3, 5, 8], 9).should == 0
  end

  it "scores a losing second-to-last move as -1" do
    @helper.score_if_takes_square([2, 4, 7], [1, 3, 5, 8], 6).should == -1
  end
  
  it "scores a guaranteed-tie second-to-last move as 0" do
    @helper.score_if_takes_square([2, 4, 7], [1, 3, 5, 8], 9).should == 0
  end

  it "scores a guaranteed-win third-to-last move as 1" do
    @helper.score_if_takes_square([1, 7, 8], [2, 4, 5], 9).should == 1
  end

  it "scores a possible-win third-to-last move as 0" do
    @helper.score_if_takes_square([1, 7, 8], [2, 4, 5], 6).should == 0
  end

  it "scores a guaranteed-loss third-to-last move as -1" do
    @helper.score_if_takes_square([2, 4, 7], [1, 3, 5], 6).should == -1
  end

  it "scores a one-possible-win third-to-last move as 0" do
    @helper.score_if_takes_square([2, 4, 7], [1, 3, 5], 9).should == 0
  end

  it "scores a one-possible-win one-guaranteed-loss third-to-last move as -1" do
    @helper.score_if_takes_square([2, 4, 7], [1, 3, 5], 8).should == -1
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


  def assert_win_loss(winning_squares, losing_squares)
    assert_score(winning_squares, losing_squares, 1)
    assert_score(losing_squares, winning_squares, -1)
  end

  def assert_score(p1_squares, p2_squares, expected_score)
    @helper.score(p1_squares, p2_squares).should == expected_score
  end
end
