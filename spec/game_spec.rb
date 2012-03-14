require 'game'

describe Game do
  before(:each) do
    @p1 = DummyPlayer.new
    @p2 = DummyPlayer.new
    @board = Board.new(@p1, @p2)
    @winner_finder = DummyWinnerFinder.new
    @dummy_ui = DummyUI.new
    @game = Game.new(@board, @winner_finder, @dummy_ui, @p1, @p2)

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

  it "announces the winner" do
    @winner_finder.set_winner "Darek"
    @game.go
    @dummy_ui.winner_announced.should == "Darek"
    @dummy_ui.tie_announced.should == nil
  end

  it "announces a tie" do
    @p1.set_moves [1, 3, 4, 6, 8]
    @p2.set_moves [2, 5, 7, 9]
    @game.go

    @dummy_ui.winner_announced.should == nil
    @dummy_ui.tie_announced.should == true
  end

  it "announces next turn" do
    @p1.set_moves [1, 3, 4, 6, 8]
    @p2.set_moves [2, 5, 7, 9]
    @game.go
 
    @dummy_ui.times_next_turn_announced.should == 9
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

  it "prints the board at the beginning refreshes after each turn" do
    @p1.set_moves [1, 3, 4, 6, 8]
    @p2.set_moves [2, 5, 7, 9]
    @game.go

    @dummy_ui.times_board_refreshed.should == 10

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

  class DummyUI
    attr_accessor :times_board_refreshed, :winner_announced, :tie_announced, :times_next_turn_announced

    def initialize
      @times_board_refreshed = 0
      @times_next_turn_announced = 0
    end

    def refresh(board)
      @times_board_refreshed += 1
    end
    
    def announce_winner(player)
      @winner_announced = player
    end
 
    def announce_tie
      @tie_announced = true
    end

    def announce_next_turn(player)
      @times_next_turn_announced += 1
    end 
  end

end
