require 'human_player'

describe HumanPlayer do
  before(:each) do
    @prompter = DummyPrompter.new
    @player = HumanPlayer.new(@prompter)
  end

  it "listens to user prompter several times" do
    @prompter.moves = [5, 9, 1]
    @player.nextMove.should == 5
    @player.nextMove.should == 9
    @player.nextMove.should == 1 
  end

  it "has a name" do
    @player.to_s.should == "You!"
  end

  class DummyPrompter
    attr_accessor :moves

    def get_square
      @moves.shift
    end
  end
end

