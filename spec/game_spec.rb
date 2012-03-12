require 'game'

describe Game do
  before(:each) do
    @board = Board.new
    @winnerFinder = DummyWinnerFinder.new
    @game = Game.new(@board, @winnerFinder)
  end

  it "knows game is over when no squres are left" do
    takeSquares(Array(1..9), "x")
    @game.isOver.should == true
  end

  it "listens to winner finder" do
    @game.isOver.should == false
    @winnerFinder.winnerShouldReturn("x")
    @game.isOver.should == true
  end

  def takeSquares(squares, player)
    squares.each{ |square| @board.take(square, player) }
  end

  class DummyWinnerFinder
    def winner
      @value
    end

    def winnerShouldReturn(value)
      @value = value
    end

  end
end
