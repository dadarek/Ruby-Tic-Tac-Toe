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
  it "takes the winning move (diaganol)" do
    @board.take(1, "x")
    @board.take(9, "x")
    @heuristic.nextMove("x").should == 5
  end

  it "blocks opponents winning move" do
    @board.take(4, "x")
    @board.take(5, "x")
    @heuristic.nextMove("o").should == 6
  end
end
