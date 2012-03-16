require 'UI/user_prompter'
require 'dummies/dummy_in'
require 'dummies/dummy_out'
require 'board'

describe UserPrompter do

  before(:each) do
    @in = DummyIn.new
    @out = DummyOut.new
    @prompter = UserPrompter.new(@in, @out)
  end

  it "has default constructor arguments" do
    some_prompter = UserPrompter.new
  end

  it "asks for square" do
    @in.read_square_responses = [2]
    @prompter.get_square.should == 2
    @out.times_prompted_for_square.should == 1
  end

  it "rejects invalid squares" do
    @in.read_square_responses = [12, "hi", nil, 9]
    @prompter.get_square.should == 9
    @out.times_prompted_for_square.should == 4
  end

  it "asks to play again" do
    @in.play_again_responses = ['y', 'n']
    @prompter.play_again?.should == true
    @prompter.play_again?.should == false
    @out.times_prompted_to_play_again.should == 2  
  end

  it "rejects invalid 'play-agains'" do
    @in.play_again_responses = ['y', nil, 'b', 'y', 'n']
    @prompter.play_again?.should == true
    @prompter.play_again?.should == true
    @prompter.play_again?.should == false
    @out.times_prompted_to_play_again.should == 5  
  end

  it "asks to play first" do
    @in.play_first_responses = ['n', 'y']
    @prompter.play_first?.should == false
    @prompter.play_first?.should == true
    @out.times_prompted_to_play_first.should == 2  
  end

  it "rejects invalid 'play-firsts'" do
    @in.play_first_responses = ['n', nil, 'b', 'y', 'n']
    @prompter.play_first?.should == false
    @prompter.play_first?.should == true
    @prompter.play_first?.should == false
    @out.times_prompted_to_play_first.should == 5  
  end

  it "ignores trailing whitespaces" do
    @in.read_square_responses = [" 1 \n ", "   3\n"]
    @prompter.get_square.should == 1
    @prompter.get_square.should == 3
    
    @in.play_again_responses = ["  y \n", "n\n"]
    @prompter.play_again?.should == true
    @prompter.play_again?.should == false
  end
end
