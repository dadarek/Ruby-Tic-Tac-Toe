require 'board'

describe Board, "#playerAt" do
  it "has empty squares" do
    board = Board.new

    (1..10).each{|i| board.isEmpty(i).should == true }
  end
  it "remembers players squares" do
    board = Board.new

    board.takeSquare(1, "x")
    board.takeSquare(2, "o")

    board.playerOwnsSquare("x", 1).should == true
    board.playerOwnsSquare("o", 2).should == true
    board.playerOwnsSquare("x", 3).should == false
  end
end 
