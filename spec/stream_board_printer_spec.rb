require 'stream_board_printer'

describe StreamBoardPrinter do
  before(:each) do
    @stream = DummyStream.new
    @printer = StreamBoardPrinter.new(@stream)
    @board = Board.new("x", "o")
  end
    

  it "prints an empty grid" do
    @printer.print(@board)
    @stream.what_printed.should == " | | \n | | \n | | \n"
  end

  it "prints a somewhat-filled grid" do
    @board.take(1, "x")
    @board.take(2, "o")
    @board.take(5, "x")
    @board.take(9, "o")
    @printer.print(@board)

    @stream.what_printed.should == "x|o| \n |x| \n | |o\n"
  end

  it "prints the winner" do
    @printer.print_winner("x")
    @stream.what_printed.should == "x won!\n"
  end
  
  it "prints a tie" do
    @printer.print_tie
    @stream.what_printed.should == "You tied!\n"
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
