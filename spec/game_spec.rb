require 'game'

describe Game do
  before(:each) do
    @p1 = DummyPlayer.new
    @p2 = DummyPlayer.new
    @board = Board.new(@p1, @p2)
    @winnerFinder = DummyWinnerFinder.new
    @boardPrinter = DummyPrinter.new
    @game = Game.new(@board, @winnerFinder, @boardPrinter, @p1, @p2)

    DummyPlayer.resetCounter
  end

  it "knows game is over when no squres are left" do
    takeSquares(Array(1..9), @p1)
    @game.isOver.should == true
  end

  it "listens to winner finder" do
    @game.isOver.should == false
    @winnerFinder.setWinner(@p1)
    @game.isOver.should == true
  end

  it "prints the winner" do
    @winnerFinder.setWinner "Darek"
    @game.go()
    @boardPrinter.winner_printed.should == "Darek"
  end

  it "asks players for their moves" do
    @p1.setMoves([1, 3, 4, 6, 8])
    @p2.setMoves([2, 5, 7, 9])
    @game.go()
    @board.getPlayerSquares(@p1).should =~ [1, 3, 4, 6, 8]
    @board.getPlayerSquares(@p2).should =~ [2, 5, 7, 9]
  end

  it "asks players for their moves - in order" do
    @p1.setMoves([1, 3, 4, 6, 8])
    @p2.setMoves([2, 5, 7, 9])
    @game.go()

    @p1.orderCalled.should == [1, 3, 5, 7, 9]
    @p2.orderCalled.should == [2, 4, 6, 8]
  end

  it "prints the board after each turn" do
    @p1.setMoves([1, 3, 4, 6, 8])
    @p2.setMoves([2, 5, 7, 9])
    @game.go()

    @boardPrinter.times_board_printed.should == 9

  end

  def takeSquares(squares, player)
    squares.each{ |square| @board.take(square, player) }
  end

  class DummyWinnerFinder
    def winner
      @winner
    end

    def setWinner(winner)
      @winner = winner
    end
  end

  class DummyPlayer
    def self.resetCounter 
      @@callbackCounter = 0
    end

    def initialize
      @orderCalled = Array.new
    end

    def setMoves(moves)
      @moves = moves
    end

    def nextMove
      @orderCalled.push(@@callbackCounter += 1)
      @moves.pop
    end

    def orderCalled
      @orderCalled
    end
  end

  class DummyPrinter
    attr_accessor :times_board_printed, :winner_printed

    def initialize
      @times_board_printed = 0
    end

    def print(board)
      @times_board_printed += 1
    end
    
    def print_winner(player)
      @winner_printed = player
    end
  end

end
