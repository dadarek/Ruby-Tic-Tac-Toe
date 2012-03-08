require 'board'

describe Board, "#playerAt" do
  before(:each) do
    @board = Board.new
  end

  it "has empty squares" do
    (1..9).each{|i| @board.isEmpty(i).should == true }
  end
  it "remembers players squares" do
    @board.take(1, "x")
    @board.take(3, "x")

    @board.getPlayerSquares("x").should == [1, 3]
  end
  it "remembers 2 players squares" do
    @board.take(2, "x")
    @board.take(5, "x")
    @board.take(9, "x")
    
    @board.take(8, "o")
    @board.take(1, "o")

    @board.getPlayerSquares("x").sort.should == [2, 5, 9]
    @board.getPlayerSquares("o").sort.should == [1, 8]
  end

  it "knows its empty squares" do
    @board.getEmptySquares().should == (1..9).to_a()
  end
  it "removes empty squares after players take them" do
    @board.take(5, "b")
    @board.take(9, "c")

    @board.getEmptySquares().should == [1, 2, 3, 4, 6, 7, 8]
  end
end 
