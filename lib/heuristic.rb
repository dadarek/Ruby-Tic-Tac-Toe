class Heuristic
  @@WINNING_ROWS = [ [1, 2, 3], [4, 5, 6], [7, 8, 9],
                    [1, 4, 7], [2, 5, 8], [3, 6, 9],
                    [1, 5, 9], [3, 5, 7] ]
 
  def initialize(board, player, opponent)
    @board = board
    @player = player
    @opponent = opponent
  end
  def nextMove()
    result ||= findWinningMoveFor(@player)
    result ||= findWinningMoveFor(@opponent)
    result ||= tryFork()
  end
  def tryFork()
    3
  end
  def findWinningMoveFor(somePlayer)
    possibleWin = @@WINNING_ROWS.detect { |row| canWin(row, somePlayer) }
    (possibleWin & @board.getEmptySquares())[0] unless possibleWin.nil?
  end
  def canWin(row, player)
    squaresOwnedByPlayer = row & @board.getPlayerSquares(player)
    emptySquares = row & @board.getEmptySquares()

    squaresOwnedByPlayer.count == 2 and emptySquares.count == 1
  end
end
