require 'computer_player'

describe ComputerPlayer do
  it "listens to the heuristic" do
    
    heuristic = DummyHeuristic.new
    computer = ComputerPlayer.new
    computer.set_heuristic(heuristic)

    computer.next_move.should == 8
    computer.next_move.should == 9 
    computer.next_move.should == 2 
    computer.next_move.should == 7 
    computer.next_move.should == 5 
  end

  it "has a name!" do
    computer = ComputerPlayer.new
    computer.to_s.should == "Computer"
  end

  class DummyHeuristic
    def initialize
      @moves_in_order = [5, 7, 2, 9, 8]
    end
    
    def next_move
      @moves_in_order.pop
    end
  end
end
