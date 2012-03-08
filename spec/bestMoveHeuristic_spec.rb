require 'bestMoveHeuristic'
require 'board'

describe BestMoveHeuristic do
  before(:each) do
    @board = Board.new
    @player = "x"
    @heuristic = BestMoveHeuristic.new(@board, @player)
  end
  it "should play center on empty board" do
    nextMoveShouldBe(5)
  end
  it "should play corner if center is taken" do
    @board.take(5, @player)
    nextMoveShouldBe(1)
  end
  it "should play opposite corner of 3, if center is taken" do
    @board.take(5, @player)
    @board.take(3, "o")
    nextMoveShouldBe(7)
  end

  def nextMoveShouldBe(move)
    @heuristic.nextMove().should == move
  end
end
