require 'human_player'
require 'dummies/dummy_ui'

describe HumanPlayer do
  before(:each) do
    @ui = DummyUI.new
    @player = HumanPlayer.new(@ui)
  end

  it "listens to user prompter several times" do
    @ui.moves_to_make = [5, 9, 1]
    @player.next_move(nil).should == 5
    @player.next_move(nil).should == 9
    @player.next_move(nil).should == 1 
    @ui.times_square_got.should == 3
  end

  it "has a name" do
    @player.to_s.should == "You"
  end
end

