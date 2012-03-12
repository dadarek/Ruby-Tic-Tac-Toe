class WinnerFinder
  @@WINNING_SQUARES = [ [1, 2, 3], [4, 5, 6], [7, 8, 9], 
                       [1, 4, 7], [2, 5, 8], [3, 6, 9],
                       [1, 5, 9], [3, 5, 7] ]
  def initialize(board)
    @board = board
  end

  def winner()
    checkIfWinner("x") or checkIfWinner("o")
  end

  def checkIfWinner(player)
    player if @@WINNING_SQUARES.detect{ |row| playerOwnsSquares(player, row) } 
  end

  def playerOwnsSquares(player, squares)
    player if (squares & @board.getPlayerSquares(player) == squares)
  end

end

