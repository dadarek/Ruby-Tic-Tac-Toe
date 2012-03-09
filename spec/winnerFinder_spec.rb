require 'winnerFinder'

describe WinnerFinder do
  before(:each) do
    @board = Board.new
    @finder = WinnerFinder.new
  end

  it "knows when there is no winner" do
    winnerShouldBe(nil)
  end

  it "knows when there is no winner, even when squares are taken" do
    @board.take(1, "x")
    winnerShouldBe(nil)
  end

  it "knows when there is no winner when the game is tie" do
    
  end  

  it "knows how to find winner" do
    @board.take(5, "x")
    @board.take(6, "x")
    @board.take(4, "x")

    winnerShouldBe("x")
  end

  def winnerShouldBe(winner)
    @finder.winnerOf(@board).should == winner
  end
end
   
