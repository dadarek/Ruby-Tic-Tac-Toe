require 'computer_player'
require 'dummies/dummy_heuristic'

describe ComputerPlayer do
  it "listens to the heuristic" do
    
    heuristic = DummyHeuristic.new
    computer = ComputerPlayer.new heuristic

    computer.next_move(nil).should == 8
    computer.next_move(nil).should == 9 
    computer.next_move(nil).should == 2 
    computer.next_move(nil).should == 7 
    computer.next_move(nil).should == 5 
  end

  it "has a name!" do
    computer = ComputerPlayer.new nil
    computer.to_s.should == "Computer"
  end

end
