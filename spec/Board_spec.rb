require 'board'

describe Board, "#playerAt" do
  it "remembers players squares" do
    board = Board.new

    board.takeSquare(1, "x")
    board.takeSquare(2, "o")

    board.playerAt(1).should eq("x")
    board.playerAt(2).should eq("o")
    board.playerAt(3).should be_nil
  end
  it "testing edit" do
  end
end 
