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

  it "has default streams" do
    StreamUI.new
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
  
  it "asks for next square" do
    @in.buffer = [2]
    @ui.get_square.should == 2
  end
  
  it "asks for next square, ignoring whitespace" do
    @in.buffer = ["2 ", "1\n", "3  \n", "  7 \n"]
    @ui.get_square.should == 2
    @ui.get_square.should == 1
    @ui.get_square.should == 3
    @ui.get_square.should == 7
  end

  it "asks for next square, ignoring bogus input" do
    @in.buffer = ["2 ", "hello", 0, "eric", "7 hundred", 5]
    @ui.get_square.should == 2
    @ui.get_square.should == 7
  end

  it "asks to play again" do
    @in.buffer = ["y", "yn", 0, "maybe so", "true", "YES", "no", "YeS", "N"]
    @ui.play_again?.should == true
    @ui.play_again?.should == true
    @ui.play_again?.should == false
    @ui.play_again?.should == true
    @ui.play_again?.should == false
  end

  it "asks to go first" do
    @in.buffer = ["so", "true", "YES", "NO", "YeS", "N", "n", "yn", 0, "maybe" ]
    @ui.go_first?.should == true
    @ui.go_first?.should == false
    @ui.go_first?.should == true
    @ui.go_first?.should == false
    @ui.go_first?.should == false
  end
end
