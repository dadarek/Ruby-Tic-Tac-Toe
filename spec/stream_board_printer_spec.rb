require 'stream_board_printer'

describe StreamBoardPrinter do
  it "prints an empty grid" do
    stream = DummyStream.new
    printer = StreamBoardPrinter.new(stream)
    board = Board.new("x", "o")
    printer.print(board)

    stream.what_printed.should == " | | \n | | \n | | \n"
  end

  it "prints a somewhat-filled grid" do
    stream = DummyStream.new
    printer = StreamBoardPrinter.new(stream)
    board = Board.new("x", "o")
    board.take(1, "x")
    board.take(2, "o")
    board.take(5, "x")
    board.take(9, "o")
    printer.print(board)

    stream.what_printed.should == "x|o| \n |x| \n | |o\n"
  end

  class DummyStream
    attr_accessor :what_printed
    def initialize
      @what_printed = ""
    end

    def puts(s)
      @what_printed << s 
    end
  end
end
