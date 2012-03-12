require 'user_prompter'

describe UserPrompter do

  it "asks human for name" do
    prompter = UserPrompter.new
    
    stream = DummyStream.new
    stream.ask_name
    2.times{ stream.ask_for_square }

    stream.times_asked_for_name.should == 1
    stream.times_asked_for_square.should == 2
  end

  class DummyStream
    attr_accessor :times_asked_for_name, :times_asked_for_square

    def initialize
      @times_asked_for_name = 0
      self.times_asked_for_square = 0
    end

    def ask_name
      @times_asked_for_name += 1
    end

    def ask_for_square
      self.times_asked_for_square += 1  
    end
  end
  
end
