require 'heuristic'
require 'board'

describe Heuristic do
  it "wins if possible" do
    takeSquaresAndExpectWin(1, 2, 3)
    takeSquaresAndExpectWin(1, 4, 7)
    takeSquaresAndExpectWin(7, 8, 9)
  end
end

def takeSquaresAndExpectWin(square1, square2, expectedWinningSquare)
    board = Board.new

    board.takeSquare(square1, "x")
    board.takeSquare(square2, "x")

    heuristic = Heuristic.new
    heuristic.nextMove("x", board).should eq(expectedWinningSquare)
end
