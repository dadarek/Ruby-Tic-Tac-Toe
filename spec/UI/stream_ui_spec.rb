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
  
  it "asks for next square, ignoring whitespace" do
    @in.buffer = ["2 ", "1\n", "3  \n", "  7 \n"]
    call = lambda { @ui.get_square }
    assert_consecutive_calls(call, [2, 1, 3, 7])
  end

  it "asks for next square, ignoring bogus input" do
    @in.buffer = ["2 ", "hello", 0, "eric", "7 hundred", 5]
    call = lambda { @ui.get_square }
    assert_consecutive_calls(call, [2, 7])
  end

  it "asks to play again" do
    @in.buffer = ["y ", "yn", 0, "maybe so", "true", "YES", "no", "YeS", "N"]
    call = lambda { @ui.play_again?} 
    assert_consecutive_calls(call, [true, true, false, true, false] )
  end

  it "asks to go first" do
    @in.buffer = ["so", "true", "YES", "NO", "YeS", "N\n", "n" ]
    call = lambda { @ui.go_first? }
    assert_consecutive_calls(call, [true, false, true, false, false])
  end

  it "prints the 'go first' message until you say yes or no" do
    @in.buffer = [nil, nil, nil, "YES"]
    @ui.go_first?
    @out.buffer.should == "Do you want to go first?\n" * 4
  end

  it "prints the 'next square' message until you give a valid square" do
    @in.buffer = [0, "y", {}, "bob", 5]
    @ui.get_square
    @out.buffer.should == "Select a square (1-9): \n" * 5
  end

  def assert_consecutive_calls(p, expected_values)
    expected_values.each{ |value| p.call.should == value } 
  end
end
