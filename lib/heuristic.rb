class Heuristic
  @@WINNING_ROWS = [ [1, 2, 3], [4, 5, 6], [7, 8, 9],
                    [1, 4, 7], [2, 5, 8], [3, 6, 9],
											[1, 5, 9], [3, 5, 7] ]
 
 
  def initialize(board)
    @board = board
  end
  def nextMove(player)
    result ||= getWinningMove(player)
    result
  end
  def getWinningMove(player)
    possibleWin = @@WINNING_ROWS.detect { |row| canWin(row, player) }
    getEmptySquares(possibleWin)[0] unless possibleWin.nil?
  end
  def getSquaresOwnedByPlayer(squares, player)
    squares.select { |square| @board.playerOwnsSquare(player, square) }
  end
  def getEmptySquares(squares)
    squares.select { |square| @board.isEmpty(square) }
  end
  def canWin(row, player)
    squaresOwnedByPlayer = getSquaresOwnedByPlayer(row, player)
    emptySquares = getEmptySquares(row)

    squaresOwnedByPlayer.count == 2 and emptySquares.count == 1
  end
end
