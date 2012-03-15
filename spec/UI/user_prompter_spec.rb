require 'UI/user_prompter'
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

  class DummyIn
    attr_writer :read_square_responses, :play_again_responses, :play_first_responses

    def read_square
      @read_square_responses.shift
    end

    def play_again?
      @play_again_responses.shift
    end

    def play_first?
      @play_first_responses.shift
    end
  end

  class DummyOut
    attr_reader :times_prompted_for_square, :times_prompted_to_play_again, :times_prompted_to_play_first

    def initialize
      @times_prompted_for_square = 0
      @times_prompted_to_play_again = 0
      @times_prompted_to_play_first = 0
    end

    def prompt_for_square
      @times_prompted_for_square += 1
    end

    def prompt_to_play_again
      @times_prompted_to_play_again += 1
    end

    def prompt_to_play_first
      @times_prompted_to_play_first += 1
    end
  end
  
end
