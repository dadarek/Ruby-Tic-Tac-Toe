require 'bestMoveHeuristic'
require 'board'

describe BestMoveHeuristic do
  it "should play center on empty board" do
    board = Board.new
    heuristic = BestMoveHeuristic.new
  
    heuristic.nextMove(board, "x").should == 5
  end
  it "should play corner if center is taken" do
    board = Board.new
    heuristic = BestMoveHeuristic.new
    board.take(5, "x")
    heuristic.nextMove(board, "x").should == 1
  end
  it "should play opposite corner of opponent, if center is taken" do
    board = Board.new
    heuristic = BestMoveHeuristic.new
    board.take(5, "x")
    board.take(3, "o")
    heuristic.nextMove(board, "x").should == 7
  end
end
