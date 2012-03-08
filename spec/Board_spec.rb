require 'board'

describe Board, "#playerAt" do
  before(:each) do
    @board = Board.new
  end

  it "has empty squares" do
    (1..9).each{|i| @board.isEmpty(i).should == true }
  end
  it "remembers players squares" do
    takeSquares("x", [1, 3])

    @board.getPlayerSquares("x").should == [1, 3]
  end
  it "remembers 2 players squares" do
    takeSquares("x", [2, 5, 9])
    takeSquares("o", [8, 1])

    @board.getPlayerSquares("x").sort.should == [2, 5, 9]
    @board.getPlayerSquares("o").sort.should == [1, 8]
  end
  it "can determine opponent's squares" do
    takeSquares("x", [1, 3, 5, 4])
    @board.getOpponentSquares("o").sort.should == [1, 3, 4, 5]
  end
  it "can determine both opponents' squares" do
    takeSquares("x", [7, 8])
    takeSquares("o", [3, 5])
    @board.getOpponentSquares("o").should == [7, 8]
    @board.getOpponentSquares("x").should == [3, 5]
  end
  it "knows its empty squares" do
    @board.getEmptySquares().should == Array(1..9)
  end
  it "removes empty squares after players take them" do
    takeSquares("x", [5, 9])

    @board.getEmptySquares().should == [1, 2, 3, 4, 6, 7, 8]
  end

  def takeSquares(player, squares)
    squares.each{ |square| @board.take(square, player) }
  end
end 
