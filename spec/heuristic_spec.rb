require 'heuristic'
require 'board'

describe Heuristic do
  before(:each) do
    @board = Board.new
    @heuristic = Heuristic.new(@board)
  end

  it "takes first winning row" do
    @board.takeSquare(1, "x")
    @board.takeSquare(2, "x")
    @heuristic.nextMove("x").should == 3
  end
    
  it "takes second winning row" do
    @board.takeSquare(5, "x")
    @board.takeSquare(6, "x")
    @heuristic.nextMove("x").should == 4
  end
  it "takes third winning row" do
    @board.takeSquare(9, "x")
    @board.takeSquare(8, "x")
    @heuristic.nextMove("x").should == 7
  end
  it "takes first winning column" do
    @board.takeSquare(1, "x")
    @board.takeSquare(7, "x")
    @heuristic.nextMove("x").should == 4
  end
  it "takes second winning column" do
    @board.takeSquare(5, "x")
    @board.takeSquare(8, "x")
    @heuristic.nextMove("x").should == 2
  end
  it "takes third winning column" do
    @board.takeSquare(9, "x")
    @board.takeSquare(6, "x")
    @heuristic.nextMove("x").should == 3
  end
  it "takes first winning diagonal" do
    @board.takeSquare(5, "x")
    @board.takeSquare(9, "x")
    @heuristic.nextMove("x").should == 1
  end
  it "takes second winning diagonal" do
    @board.takeSquare(7, "x")
    @board.takeSquare(3, "x")
    @heuristic.nextMove("x").should == 5
  end
end
