require 'game'

describe Game do
  before(:each) do
    @board = Board.new
    @game = Game.new(@board)
  end
  it "knows game is over when no squres are left" do
    @board.take(1, "x")
    @board.take(2, "x")
    @board.take(3, "x")
    @board.take(4, "x")
    @board.take(5, "x")
    @board.take(6, "x")
    @board.take(7, "x")
    @board.take(8, "x")
    @board.take(9, "x")

    @game.isOver.should == true
  end

  it "knows when game is not over" do
    @game.isOver.should == false
  end

#  it "knows game is over when someone gets three in a row" do
#    @board.take(1, "x")
#    @board.take(5, "x")
#    @board.take(9, "x")

#    @game.isOver.should == true
#  end
end
