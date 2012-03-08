require 'heuristic'
require 'board'

describe Heuristic do
  before(:each) do
    @board = Board.new
    @heuristic = Heuristic.new(@board)
  end

  it "takes the winning move" do
    @board.take(1, "x")
    @board.take(2, "x")
    @heuristic.nextMove("x").should == 3
  end
  it "takes the winning move (diagonal)" do
    @board.take(1, "x")
    @board.take(9, "x")
    @heuristic.nextMove("x").should == 5
  end

  it "blocks opponents winning move" do
    @board.take(4, "x")
    @board.take(5, "x")
    @heuristic.nextMove("o").should == 6
  end
  it "blocks opponents winning move (diagonal)" do
    @board.take(3, "x")
    @board.take(7, "x")
    @heuristic.nextMove("o").should == 5
  end

  it "forks when possible" do
    @board.take(1, "x")
    @board.take(9, "o")
    @board.take(7, "x")
    @board.take(4, "o")

    @heuristic.nextMove("x").should == 3
  end
end
