require 'minimax_heuristic'
require 'board_utilities'

describe MinimaxHeuristic do
  it "scores tie as 0" do
    heuristic = MinimaxHeuristic.new
    heuristic.score([1, 3, 4, 6, 8], [2, 5, 7, 9]).should == 0
  end

  it "scores win as 1" do
    heuristic = MinimaxHeuristic.new
    heuristic.score([1, 3, 4, 6, 7], [2, 5, 8, 9]).should == 1
  end
end
