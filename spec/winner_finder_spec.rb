require 'winner_finder'
require 'board_utilities'

describe WinnerFinder do
  before(:each) do
    @board = Board.new("x", "o")
  end

  it "knows when there is no winner" do
    winner_should_be(nil)
  end

  it "knows when there is no winner, even when squares are taken" do
    take(@board, "x", [1])
    winner_should_be(nil)
  end

  it "knows that there is no winner when the game is tie" do
    take_x_o(@board, [1, 3, 4, 6, 8], [2, 5, 7, 9])
    winner_should_be(nil)
  end  

  it "knows how to find winner" do
    take(@board, "x", [4, 6, 5])
    winner_should_be("x")
  end

  it "knows how to find a winner (other than x)" do
    take(@board, "o", [1, 5, 9])
    winner_should_be("o")
  end

  it "works with objects other than string literals x and o" do
    @board = Board.new({}, [])
    take(@board, {}, [7, 8, 9])
    winner_should_be({})
  end

  def winner_should_be(winner)
    WinnerFinder.winner_of(@board).should == winner
  end
end
   
