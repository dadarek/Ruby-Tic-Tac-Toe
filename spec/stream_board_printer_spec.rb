require 'stream_board_printer'

describe StreamBoardPrinter do
  it "prints an empty grid" do
    stream = DummyStream.new
    printer = StreamBoardPrinter.new(stream)
    board = Board.new
    printer.print(board)

    stream.what_printed.should == " | | \n"
  end


  class DummyStream
    attr_accessor :what_printed

    def puts(s)
      @what_printed = s 
    end
  end
end
