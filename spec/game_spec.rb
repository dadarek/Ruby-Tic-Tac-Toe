require 'game'

describe Game do
  before(:each) do
    @p1 = DummyPlayer.new
    @p2 = DummyPlayer.new
    @board = Board.new(@p1, @p2)
    @winner_finder = DummyWinnerFinder.new
    @board_printer = DummyPrinter.new
    @game = Game.new(@board, @winner_finder, @board_printer, @p1, @p2)

    DummyPlayer.reset_counter
  end

  it "knows game is over when no squres are left" do
    take(Array(1..9), @p1)
    @game.over?.should == true
  end

  it "listens to winner finder" do
    @game.over?.should == false
    @winner_finder.set_winner(@p1)
    @game.over?.should == true
  end

  it "prints the winner" do
    @winner_finder.set_winner "Darek"
    @game.go
    @board_printer.winner_printed.should == "Darek"
    @board_printer.tie_printed.should == nil
  end

  it "prints a tie" do
    @p1.set_moves [1, 3, 4, 6, 8]
    @p2.set_moves [2, 5, 7, 9]
    @game.go

    @board_printer.winner_printed.should == nil
    @board_printer.tie_printed.should == true
  end

  it "prints next turn" do
    @p1.set_moves [1, 3, 4, 6, 8]
    @p2.set_moves [2, 5, 7, 9]
    @game.go
 
    @board_printer.times_next_turn_printed.should == 9
  end

  it "asks players for their moves" do
    @p1.set_moves [1, 3, 4, 6, 8]
    @p2.set_moves [2, 5, 7, 9]
    @game.go
    @board.get_player_squares(@p1).should =~ [1, 3, 4, 6, 8]
    @board.get_player_squares(@p2).should =~ [2, 5, 7, 9]
  end

  it "asks players for their moves - in order" do
    @p1.set_moves [1, 3, 4, 6, 8]
    @p2.set_moves [2, 5, 7, 9]
    @game.go

    @p1.order_called.should == [1, 3, 5, 7, 9]
    @p2.order_called.should == [2, 4, 6, 8]
  end

  it "prints the board after each turn" do
    @p1.set_moves [1, 3, 4, 6, 8]
    @p2.set_moves [2, 5, 7, 9]
    @game.go

    @board_printer.times_board_printed.should == 9

  end

  def take(squares, player)
    squares.each{ |square| @board.take(square, player) }
  end

  class DummyWinnerFinder
    def winner
      @winner
    end

    def set_winner(winner)
      @winner = winner
    end
  end

  class DummyPlayer
    def self.reset_counter 
      @@callback_counter = 0
    end

    def initialize
      @order_called = Array.new
    end

    def set_moves(moves)
      @moves = moves
    end

    def next_move
      @order_called.push(@@callback_counter += 1)
      @moves.pop
    end

    def order_called
      @order_called
    end
  end

  class DummyPrinter
    attr_accessor :times_board_printed, :winner_printed, :tie_printed, :times_next_turn_printed

    def initialize
      @times_board_printed = 0
      @times_next_turn_printed = 0
    end

    def print(board)
      @times_board_printed += 1
    end
    
    def print_winner(player)
      @winner_printed = player
    end
 
    def print_tie
      @tie_printed = true
    end

    def print_next_turn(player)
      @times_next_turn_printed += 1
    end 
  end

end
