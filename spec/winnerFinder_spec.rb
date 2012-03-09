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
    @board.take(1, "x")
    winnerShouldBe(nil)
  end

  it "knows that there is no winner when the game is tie" do
    @board.take(1, "x")
    @board.take(3, "x")
    @board.take(4, "x")
    @board.take(6, "x")
    @board.take(8, "x")
    @board.take(2, "o")
    @board.take(5, "o")
    @board.take(7, "o")
    @board.take(9, "o")
    winnerShouldBe(nil)
  end  

  it "knows how to find winner" do
    @board.take(5, "x")
    @board.take(6, "x")
    @board.take(4, "x")

    winnerShouldBe("x")
  end

  it "knows how to find a winner (other than x)" do
    @board.take(1, "o")
    @board.take(5, "o")
    @board.take(9, "o")

    winnerShouldBe("o")
  end

  def winnerShouldBe(winner)
    @finder.winner().should == winner
  end
end
   
