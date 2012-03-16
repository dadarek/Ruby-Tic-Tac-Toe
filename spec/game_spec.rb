require 'game'
require 'dummies/dummy_player'
require 'dummies/dummy_ui'

describe Game do
  before(:each) do
    p1 = DummyPlayer.new
    p2 = DummyPlayer.new
    @board = Board.new(p1, p2)
    @ui = DummyUI.new
    @game = Game.new(@board, @ui)

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
    @ui.winner_announced.should == @board.p1
    @ui.times_tie_announced.should == 0
  end

  it "announces a tie" do
    set_tie_moves_and_play
    @ui.winner_announced.should == nil
    @ui.times_tie_announced.should == 1
  end

  it "announces next turn" do
    set_tie_moves_and_play
    @ui.times_next_turn_announced.should == 9
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
    @ui.times_board_refreshed.should == 10
  end
  
  def set_tie_moves_and_play
    @board.p1.set_moves [1, 3, 4, 6, 8]
    @board.p2.set_moves [2, 5, 7, 9]
    @game.play
  end
end
