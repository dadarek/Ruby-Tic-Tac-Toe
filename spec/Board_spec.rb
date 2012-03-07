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

    board.playerAt(1).should eq("x")
    board.playerAt(2).should eq("o")
    board.playerAt(3).should be_nil
  end
end 
