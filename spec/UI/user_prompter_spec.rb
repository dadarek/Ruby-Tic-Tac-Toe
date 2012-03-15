require 'UI/user_prompter'
require 'dummies/dummy_in'
require 'dummies/dummy_out'
require 'board'

describe UserPrompter do

  before(:each) do
    @inStream = DummyIn.new
    @outStream = DummyOut.new
    @prompter = UserPrompter.new(@inStream, @outStream)
  end

  it "has default constructor arguments" do
    some_prompter = UserPrompter.new
  end

  it "asks for square" do
    @inStream.read_square_responses = [2]
    @prompter.get_square.should == 2
    @outStream.times_prompted_for_square.should == 1
  end

  it "rejects invalid squares" do
    @inStream.read_square_responses = [12, "hi", nil, 9]
    @prompter.get_square.should == 9
    @outStream.times_prompted_for_square.should == 4
  end

  it "asks to play again" do
    @inStream.play_again_responses = ['y', 'n']
    @prompter.play_again?.should == true
    @prompter.play_again?.should == false
    @outStream.times_prompted_to_play_again.should == 2  
  end

  it "rejects invalid 'play-agains'" do
    @inStream.play_again_responses = ['y', nil, 'b', 'y', 'n']
    @prompter.play_again?.should == true
    @prompter.play_again?.should == true
    @prompter.play_again?.should == false
    @outStream.times_prompted_to_play_again.should == 5  
  end

  it "asks to play first" do
    @inStream.play_first_responses = ['n', 'y']
    @prompter.play_first?.should == false
    @prompter.play_first?.should == true
    @outStream.times_prompted_to_play_first.should == 2  
  end

  it "rejects invalid 'play-firsts'" do
    @inStream.play_first_responses = ['n', nil, 'b', 'y', 'n']
    @prompter.play_first?.should == false
    @prompter.play_first?.should == true
    @prompter.play_first?.should == false
    @outStream.times_prompted_to_play_first.should == 5  
  end

  it "ignores trailing whitespaces" do
    @inStream.read_square_responses = [" 1 \n ", "   3\n"]
    @prompter.get_square.should == 1
    @prompter.get_square.should == 3
    
    @inStream.play_again_responses = ["  y \n", "n\n"]
    @prompter.play_again?.should == true
    @prompter.play_again?.should == false
  end
end
