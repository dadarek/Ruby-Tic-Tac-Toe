require 'heuristic'
require 'board'

describe Heuristic do
  before(:each) do
    @board = Board.new
    @heuristic = Heuristic.new(@board, "x", "o")
  end

  it "takes the winning move" do
    @board.take(1, "x")
    @board.take(2, "x")
    @heuristic.nextMove().should == 3
  end
  it "takes the winning move (diagonal)" do
    @board.take(1, "x")
    @board.take(9, "x")
    @heuristic.nextMove().should == 5
  end

  it "blocks opponents winning move" do
    @board.take(4, "o")
    @board.take(5, "o")
    @heuristic.nextMove().should == 6
  end
  it "blocks opponents winning move (diagonal)" do
    @board.take(3, "o")
    @board.take(7, "o")
    @heuristic.nextMove().should == 5
  end

  it "forks when possible" do
    @board.take(1, "x")
    @board.take(9, "o")
    @board.take(7, "x")
    @board.take(4, "o")

    @heuristic.nextMove().should == 3
  end
end
