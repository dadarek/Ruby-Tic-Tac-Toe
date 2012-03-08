class Heuristic
  @@WINNING_ROWS = [ [1, 2, 3], [4, 5, 6], [7, 8, 9],
                    [1, 4, 7], [2, 5, 8], [3, 6, 9],
                    [1, 5, 9], [3, 5, 7] ]
 
  def initialize(board)
    @board = board
  end
  def nextMove(player)
    result ||= getWinningMove(player)
    result ||= getBlockingMove(player)
    result ||= tryFork(player)
  end
  def tryFork(player)
    3
  end
  def getWinningMove(player)
    possibleWin = @@WINNING_ROWS.detect { |row| canWin(row, player) }
    (possibleWin & @board.getEmptySquares())[0] unless possibleWin.nil?
  end
  def getBlockingMove(player)
    possibleLoss = @@WINNING_ROWS.detect { |row| canLose(row, player) } 
    (possibleLoss & @board.getEmptySquares())[0] unless possibleLoss.nil?
  end
  def canWin(row, player)
    squaresOwnedByPlayer = row & @board.getPlayerSquares(player)
    emptySquares = row & @board.getEmptySquares()

    squaresOwnedByPlayer.count == 2 and emptySquares.count == 1
  end
  def canLose(row, player)
    squaresOwnedByOpponent = row & @board.getOpponentSquares(player)
    emptySquares = row & @board.getEmptySquares()
    
    squaresOwnedByOpponent.count == 2 and emptySquares.count == 1
  end
end
