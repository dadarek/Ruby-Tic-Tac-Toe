require 'game'

describe Game do
  before(:each) do
    @board = Board.new
    @game = Game.new(@board)
  end
  it "knows game is over when no squres are left" do
    takeSquares(Array(1..9), "x")
    @game.isOver.should == true
  end

  it "knows when game is not over" do
    @game.isOver.should == false
  end

  it "knows game is over when someone gets three in a row" do
    takeSquares([1, 5, 9], "x")
    @game.isOver.should == true
  end

  def takeSquares(squares, player)
    squares.each{ |square| @board.take(square, player) }
  end
end
