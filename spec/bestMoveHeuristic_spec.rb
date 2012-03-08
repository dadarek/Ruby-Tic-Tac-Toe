require 'bestMoveHeuristic'
require 'board'

describe BestMoveHeuristic do
  before(:each) do
    @board = Board.new
    @heuristic = BestMoveHeuristic.new(@board, "x")
  end
  it "should play center on empty board" do
    nextMoveShouldBe(5)
  end
  it "should play corner if center is taken" do
    @board.take(5, "x")
    nextMoveShouldBe(1)
  end
    
  it "should play opposite corner 1, if opponent took 9 and center is taken" do
    shouldTakeOppositeCorner(9, 1)
  end
  it "should play opposite corner 9, if opponent took 1 and center is taken" do
    shouldTakeOppositeCorner(1, 9)
  end
  it "should play opposite corner 7, if opponent took 3 and center is taken" do
    shouldTakeOppositeCorner(3, 7)
  end
  it "should play opposite corner 3, if opponent took 7 and center is taken" do
    shouldTakeOppositeCorner(7, 3)
  end
  def shouldTakeOppositeCorner(opponentsCorner, expectedMove)
    @board.take(5, "x")
    @board.take(opponentsCorner, "o")
    nextMoveShouldBe(expectedMove)
  end
  def nextMoveShouldBe(move)
    @heuristic.nextMove.should == move
  end
end
