class ComputerPlayer
  def set_heuristic(heuristic)
    @heuristic = heuristic
  end
  
  def next_move
    @heuristic.next_move
  end

  def to_s
    "Computer"
  end
end
