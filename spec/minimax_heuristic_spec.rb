require 'minimax_heuristic'
require 'board_utilities'

describe MinimaxHeuristic do
  it "scores tie as 0" do
    assert_score([1, 3, 4, 6, 8], [2, 5, 7, 9], 0)
  end

  it "scores win as 1 and loss as -1 (1, 2, 3)" do
    assert_win_loss([1, 2, 3, 5, 8], [4, 6, 7, 9])
  end

  it "scores win as 1 and loss as -1 (4, 5, 6)" do
    assert_win_loss([2, 4, 5, 6, 8], [1, 3, 7, 9])
  end

  it "scores win as 1 and loss as -1 (7, 8, 9)" do
    assert_win_loss([2, 5, 7, 8, 9], [1, 3, 4, 6])
  end

  it "scores win as 1 and loss as -1 (1, 4, 7)" do
    assert_win_loss([1, 2, 4, 7, 9], [3, 5, 6, 8])
  end

  it "scores win as 1 and loss as -1 (2, 5, 8)" do
    assert_win_loss([2, 3, 4, 5, 8], [1, 6, 7, 9])
  end

  it "scores win as 1 and loss as -1 (3, 6, 9)" do
    assert_win_loss([1, 3, 6, 8, 9], [2, 4, 5, 7])
  end

  it "scores win as 1 and loss as -1 (1, 5, 9)" do
    assert_win_loss([1, 3, 4, 5, 9], [2, 6, 7, 8])
  end

  it "scores win as 1 and loss as -1 (3, 5, 7)" do
    assert_win_loss([1, 3, 5, 7, 8], [2, 4, 6, 9])
  end

  def assert_win_loss(winning_squares, losing_squares)
    assert_score(winning_squares, losing_squares, 1)
    assert_score(losing_squares, winning_squares, -1)
  end

  def assert_score(p1_squares, p2_squares, expected_score)
    MinimaxHeuristic.score(p1_squares, p2_squares).should == expected_score
  end
end
