require 'winner_finder'

describe WinnerFinder do
  before(:each) do
    @board = Board.new("x", "o")
    @finder = WinnerFinder.new
  end

  it "knows when there is no winner" do
    winner_should_be(nil)
  end

  it "knows when there is no winner, even when squares are taken" do
    take([1], "x")
    winner_should_be(nil)
  end

  it "knows that there is no winner when the game is tie" do
    take([1, 3, 4, 6, 8], "x")
    take([2, 5, 7, 9], "o")
    winner_should_be(nil)
  end  

  it "knows how to find winner" do
    take([4, 6, 5], "x")
    winner_should_be("x")
  end

  it "knows how to find a winner (other than x)" do
    take([1, 5, 9], "o")
    winner_should_be("o")
  end

  it "works with objects other than string literals x and o" do
    @board = Board.new({}, [])
    @finder = WinnerFinder.new
    take([7, 8, 9], {})
    winner_should_be({})
  end

  def take(squares, player)
    squares.each{ |square| @board.take(square, player) }
  end

  def winner_should_be(winner)
    @finder.winner_of(@board).should == winner
  end
end
   
