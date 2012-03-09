require 'winnerFinder'

describe WinnerFinder do
  before(:each) do
    @board = Board.new
    @finder = WinnerFinder.new(@board)
  end

  it "knows when there is no winner" do
    winnerShouldBe(nil)
  end

  it "knows when there is no winner, even when squares are taken" do
    takeSquares([1], "x")
    winnerShouldBe(nil)
  end

  it "knows that there is no winner when the game is tie" do
    takeSquares([1, 3, 4, 6, 8], "x")
    takeSquares([2, 5, 7, 9], "o")
    winnerShouldBe(nil)
  end  

  it "knows how to find winner" do
    takeSquares([4, 6, 5], "x")
    winnerShouldBe("x")
  end

  it "knows how to find a winner (other than x)" do
    takeSquares([1, 5, 9], "o")
    winnerShouldBe("o")
  end

  def takeSquares(squares, player)
    squares.each{ |square| @board.take(square, player) }
  end

  def winnerShouldBe(winner)
    @finder.winner().should == winner
  end
end
   
