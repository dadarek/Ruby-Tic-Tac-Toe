class Heuristic
  def initialize
  end
  def nextMove(player, board)
    result = nil
    if board.playerAt(1) == player and board.playerAt(2) == player
      result = 3
    end
    if board.playerAt(1) == player and board.playerAt(4) == player
      result = 7
    end
    result
  end
end
