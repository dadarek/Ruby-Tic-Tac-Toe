class ComputerPlayer
  def set_heuristic(heuristic)
    @heuristic = heuristic
  end
  
  def nextMove
    @heuristic.nextMove
  end

  def to_s
    "Computer"
  end
end
