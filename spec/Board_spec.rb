require 'board'

describe Board, "#playerAt" do
  before(:each) do
    @board = Board.new("x", "o")
  end

  it "has empty squares" do
    (1..9).each{|i| @board.empty?(i).should == true }
  end

  it "remembers players squares" do
    take("x", [1, 3])

    @board.get_player_squares("x").should =~ [1, 3]
  end

  it "remembers 2 players squares" do
    take("x", [2, 5, 9])
    take("o", [8, 1])

    @board.get_player_squares("x").should =~ [2, 5, 9]
    @board.get_player_squares("o").should =~ [1, 8]
  end

  it "knows its empty squares" do
    @board.get_empty_squares().should =~ Array(1..9)
  end

  it "removes empty squares after players take them" do
    take("x", [5, 9])
    @board.get_empty_squares().should =~ [1, 2, 3, 4, 6, 7, 8]
  end

  def take(player, squares)
    squares.each{ |square| @board.take(square, player) }
  end
end 
