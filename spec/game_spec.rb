require 'game'

describe Game do
  before(:each) do
    p1 = DummyPlayer.new
    p2 = DummyPlayer.new
    @board = Board.new(p1, p2)
    @dummy_ui = DummyUI.new
    @game = Game.new(@board, @dummy_ui)

    DummyPlayer.reset_counter
  end

  it "doesn't let players take a square already taken" do
    @board.p1.set_moves [1, 2, 3, 4, 6, 8]
    @board.p2.set_moves [2, 5, 7, 9]
    @game.play
    @board.player_owns_square(@board.p1, 2).should == false
    @board.player_owns_square(@board.p2, 2).should == true
  end

  it "knows how to find the winner" do
    @board.p1.set_moves [1, 2, 3]
    @board.p2.set_moves [4, 5]
    @game.play
    @dummy_ui.winner_announced.should == @board.p1
    @dummy_ui.tie_announced.should == nil
  end

  it "announces a tie" do
    set_tie_moves_and_play
    @dummy_ui.winner_announced.should == nil
    @dummy_ui.tie_announced.should == true
  end

  it "announces next turn" do
    set_tie_moves_and_play
    @dummy_ui.times_next_turn_announced.should == 9
  end

  it "asks players for their moves" do
    set_tie_moves_and_play
    @board.get_player_squares(@board.p1).should =~ [1, 3, 4, 6, 8]
    @board.get_player_squares(@board.p2).should =~ [2, 5, 7, 9]
  end

  it "asks players for their moves - in order" do
    set_tie_moves_and_play
    @board.p1.order_called.should == [1, 3, 5, 7, 9]
    @board.p2.order_called.should == [2, 4, 6, 8]
  end

  it "prints the board at the beginning refreshes after each turn" do
    set_tie_moves_and_play
    @dummy_ui.times_board_refreshed.should == 10
  end
  
  def set_tie_moves_and_play
    @board.p1.set_moves [1, 3, 4, 6, 8]
    @board.p2.set_moves [2, 5, 7, 9]
    @game.play
  end

  def take(squares, player)
    squares.each{ |square| @board.take(square, player) }
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

    def next_move(board)
      @order_called.push(@@callback_counter += 1)
      @moves.pop
    end

    def order_called
      @order_called
    end
  end

  class DummyUI
    attr_accessor :times_board_refreshed, :winner_announced,
      :tie_announced, :times_next_turn_announced

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
