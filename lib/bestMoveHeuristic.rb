class BestMoveHeuristic
  def nextMove(board, player)
    if board.isEmpty(5) then
      return 5
    end
    if not board.isEmpty(3) and board.getPlayerOn(3) != player and board.isEmpty(7) then
      return 7
    end
    1
  end
end
