require 'heuristic'
require 'board'

describe Heuristic do
  before(:each) do
    @board = Board.new
    @heuristic = Heuristic.new(@board)
  end

  it "take first winning row" do
    @board.takeSquare(1, "x")
    @board.takeSquare(2, "x")
    @heuristic.nextMove("x").should == 3
  end
  it "takes second winning row" do
    @board.takeSquare(5, "x")
    @board.takeSquare(6, "x")
    @heuristic.nextMove("x").should == 4
  end
end
