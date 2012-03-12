require 'user_prompter'

describe UserPrompter do

  it "asks human for name" do
    inStream = DummyIn.new
    outStream = DummyOut.new

    prompter = UserPrompter.new(inStream, outStream)

    prompter.get_square.should == 12

    inStream.square_read.should == true
    outStream.prompted_for_square.should == true
    
  end

  class DummyIn
    attr_reader :square_read

    def read_square
      @square_read = true
      12 
    end
  end

  class DummyOut
    attr_reader :prompted_for_square

    def prompt_for_square
      @prompted_for_square = true
    end
  end
  
end
