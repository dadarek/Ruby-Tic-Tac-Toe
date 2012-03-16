require 'UI/stream_ui'
require 'dummies/dummy_out'
require 'dummies/dummy_in'
require 'board_utilities'

describe StreamUI do
  before(:each) do
    @in = DummyIn.new
    @out = DummyOut.new
    @ui = StreamUI.new(@in, @out)
    @board = Board.new("x", "o")
  end
    

  it "prints an empty grid" do
    @ui.refresh(@board)
    @out.buffer.should == " | | \n | | \n | | \n"
  end

  it "prints a somewhat-filled grid" do
    take_x_o(@board, [1, 5], [2, 9])
    @ui.refresh(@board)
    @out.buffer.should == "x|o| \n |x| \n | |o\n"
  end

  it "announces the winner" do
    @ui.announce_winner("x")
    @out.buffer.should == "x won!\n"
  end
  
  it "announces a tie" do
    @ui.announce_tie
    @out.buffer.should == "You tied!\n"
  end

  it "announces next turn" do
    @ui.announce_next_turn "Eric"
    @out.buffer.should == "Eric's turn next\n"
  end

  it "has default streams" do
    StreamUI.new
  end
end
