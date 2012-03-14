require 'UI/stream_board_printer'

describe StreamBoardPrinter do
  before(:each) do
    @stream = DummyStream.new
    @printer = StreamBoardPrinter.new(@stream)
    @board = Board.new("x", "o")
  end
    

  it "prints an empty grid" do
    @printer.refresh(@board)
    @stream.what_printed.should == " | | \n | | \n | | \n"
  end

  it "prints a somewhat-filled grid" do
    @board.take(1, "x")
    @board.take(2, "o")
    @board.take(5, "x")
    @board.take(9, "o")
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
    StreamBoardPrinter.new
  end

  class DummyStream
    attr_accessor :what_printed
    def initialize
      @what_printed = ""
    end

    def printf(s)
      @what_printed << s 
    end
  end
end
