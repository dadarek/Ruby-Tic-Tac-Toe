require 'UI/stream_ui'
require 'dummies/dummy_stream'
require 'dummies/dummy_out'
require 'dummies/dummy_in'
require 'board_utilities'

describe StreamUI do
  before(:each) do
    @stream = DummyStream.new
    @printer = StreamUI.new(@stream, @in, @out)
    @board = Board.new("x", "o")
  end
    

  it "prints an empty grid" do
    @printer.refresh(@board)
    @stream.what_printed.should == " | | \n | | \n | | \n"
  end

  it "prints a somewhat-filled grid" do
    take_x_o(@board, [1, 5], [2, 9])
    @printer.refresh(@board)

    @stream.what_printed.should == "x|o| \n |x| \n | |o\n"
  end

  it "announces the winner" do
    @printer.announce_winner("x")
    @stream.what_printed.should == "x won!\n"
  end
  
  it "announces a tie" do
    @printer.announce_tie
    @stream.what_printed.should == "You tied!\n"
  end

  it "announces next turn" do
    @printer.announce_next_turn "Eric"
    @stream.what_printed.should == "Eric's turn next\n"
  end

  it "has a default stream" do
    StreamUI.new
  end
end
