class BestMoveHeuristic
  def initialize(board, player)
    @board = board
    @player = player
  end
  def nextMove()
    if @board.isEmpty(5) then
      return 5
    end
    if opponentOwns(3) and @board.isEmpty(7) then
      return 7
    end
    1
  end
  def opponentOwns(square)
    not @board.isEmpty(square) and @board.getPlayerOn(square) != @player
  end
end
