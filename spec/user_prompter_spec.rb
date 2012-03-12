require 'user_prompter'

describe UserPrompter do

  it "asks for square" do
    inStream = DummyIn.new
    outStream = DummyOut.new

    prompter = UserPrompter.new(inStream, outStream)

    inStream.read_square_responses = [2]
    prompter.get_square.should == 2

    inStream.times_square_read.should == 1
    outStream.times_prompted_for_square.should == 1
    
  end

  it "rejects invalid squares" do
    inStream = DummyIn.new
    outStream = DummyOut.new

    prompter = UserPrompter.new(inStream, outStream)

    inStream.read_square_responses = [12, "hi", nil, 9]
    prompter.get_square.should == 9

    inStream.times_square_read.should == 4
    outStream.times_prompted_for_square.should == 4
    
  end

  class DummyIn
    attr_reader :times_square_read
    attr_writer :read_square_responses

    def initialize
      @times_square_read = 0
    end

    def read_square
      @times_square_read += 1
      @read_square_responses.shift
    end
  end

  class DummyOut
    attr_reader :times_prompted_for_square

    def initialize
      @times_prompted_for_square = 0
    end

    def prompt_for_square
      @times_prompted_for_square += 1
    end
  end
  
end
