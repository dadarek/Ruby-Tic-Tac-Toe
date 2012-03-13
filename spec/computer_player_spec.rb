require 'computer_player'

describe ComputerPlayer do
  it "listens to the heuristic" do
    
    heuristic = DummyHeuristic.new
    computer = ComputerPlayer.new
    computer.set_heuristic(heuristic)

    computer.nextMove.should == 8
    computer.nextMove.should == 9 
    computer.nextMove.should == 2 
    computer.nextMove.should == 7 
    computer.nextMove.should == 5 
  end

  it "has a name!" do
    computer = ComputerPlayer.new
    computer.to_s.should == "Computer"
  end

  class DummyHeuristic
    def initialize
      @movesInOrder = [5, 7, 2, 9, 8]
    end
    
    def nextMove
      @movesInOrder.pop
    end
  end
end
