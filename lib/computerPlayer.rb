class ComputerPlayer
  def initialize(heuristic)
    @heuristic = heuristic
  end
  
  def nextMove
    @heuristic.nextMove
  end
end
