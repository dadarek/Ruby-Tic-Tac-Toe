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

  it "forks when possible (case 1)" do
    @board.take(1, "x")
    @board.take(9, "o")
    @board.take(7, "x")
    @board.take(4, "o")

    @heuristic.nextMove().should == 3
  end

  it "forks when possible (case 2)" do
    @board.take(1, "x")
    @board.take(7, "o")
    @board.take(3, "x")
    @board.take(2, "o")

    @heuristic.nextMove().should == 9
  end

  it "blocks fork" do
    @board.take(1, "o")
    @board.take(5, "x")
    @board.take(9, "o")

    @heuristic.nextMove().should satisfy{ |square| [2, 4, 6, 8].include? square }
  end

  it "takes the center if open" do
    @board.take(9, "x")
    @board.take(4, "o")
    @heuristic.nextMove().should == 5
  end
end
