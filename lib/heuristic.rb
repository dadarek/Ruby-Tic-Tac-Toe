class Heuristic
  def initialize
  end
  def nextMove(player, board)
    result ||= get3rdIfPlayerOwns2(player, board, 1, 2, 3)
    result ||= get3rdIfPlayerOwns2(player, board, 1, 4, 7)
    result
  end
  def get3rdIfPlayerOwns2(player, board, square1, square2, square3)
    result = nil
    if(playerOwnsSquares(player, board, square1, square2))
      result = square3
    end
    result
  end
  def playerOwnsSquares(player, board, square1, square2)
    board.playerAt(square1) == player and board.playerAt(square2) == player  
  end
end
