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
    takeCenter()
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

  it "should play 3 or 7, if 1, 9, and center are taken" do
    takeCenter()
    @board.take(1, "x")
    @board.take(9, "o")
    @heuristic.nextMove.should satisfy{ |move| move == 3 or move == 7 }
  end
  it "should play 1 or 9, if 3, 7, and center are taken" do
    takeCenter()
    @board.take(3, "x")
    @board.take(7, "o")
    @heuristic.nextMove.should satisfy{ |move| [1, 9].include? move }
  end
  it "should take empty side, if all corners and center are taken" do
    takeCenter()
    @board.take(1, "o")
    @board.take(3, "x")
    @board.take(7, "o")
    @board.take(4, "x")
    @board.take(9, "o")
    @heuristic.nextMove.should satisfy{ |move| [2, 6, 8].include? move }
  end
  it "should take empty side, if all corners and center are taken" do
    takeCenter()
    @board.take(3, "o")
    @board.take(9, "x")
    @board.take(1, "o")
    @board.take(2, "x")
    @board.take(7, "o")
    @heuristic.nextMove.should satisfy{ |move| [4, 6, 8].include? move }
  end
    
  def takeCenter()
    @board.take(5, "x")
  end
  def shouldTakeOppositeCorner(opponentsCorner, expectedMove)
    takeCenter()
    @board.take(opponentsCorner, "o")
    nextMoveShouldBe(expectedMove)
  end
  def nextMoveShouldBe(move)
    @heuristic.nextMove.should == move
  end
end
