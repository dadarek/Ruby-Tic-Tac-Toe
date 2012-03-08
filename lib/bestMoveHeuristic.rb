class BestMoveHeuristic
  def initialize(board, player)
    @board = board
    @player = player
  end
  def nextMove()
    result ||= takeIfEmpty(5)
    result ||= takeIfEmpty(7) if opponentOwns(3)
    result ||= takeIfEmpty(9) if opponentOwns(1)
    result ||= takeIfEmpty(3) if opponentOwns(7)
    result ||= takeFirstEmpty([1, 3, 7, 9, 2, 4, 6, 8])
  end
  def takeFirstEmpty(squares)
    squares.detect { |i| @board.isEmpty(i) }
  end
  def takeIfEmpty(square)
    square if @board.isEmpty(square)
  end
  def opponentOwns(square)
    not @board.isEmpty(square) and @board.getPlayerOn(square) != @player
  end
end
