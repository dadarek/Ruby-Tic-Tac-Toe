class ComputerPlayer
  def initialize(heuristic)
    @heuristic = heuristic
  end
  
  def next_move(board)
    @heuristic.next_move(board, self)
  end

  def to_s
    "Computer"
  end
end
