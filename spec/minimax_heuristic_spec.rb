require 'minimax_heuristic'
require 'board_utilities'

describe MinimaxHeuristic do
  it "scores tie as 0" do
    assert_score([1, 3, 4, 6, 8], [2, 5, 7, 9], 0)
  end

  it "scores win as 1 and loss as -1 (1, 3, 7)" do
    assert_score([1, 3, 4, 6, 7], [2, 5, 8, 9], 1)
    assert_score([2, 5, 8, 9], [1, 3, 4, 6, 7], -1)
  end

  it "scores win as 1 and loss as -1 (1, 2, 3)" do
    assert_score([1, 2, 3, 5, 8], [4, 6, 7, 9], 1)
    assert_score([4, 6, 7, 9], [1, 2, 3, 5, 8], -1)
  end

  def assert_score(p1_squares, p2_squares, expected_score)
    MinimaxHeuristic.score(p1_squares, p2_squares).should == expected_score
  end
end
