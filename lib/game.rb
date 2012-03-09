class Game
  def initialize(board)
    @board = board  
  end

  def isOver 
    boardIsFull or somebodyWon
  end

  def boardIsFull
    @board.getEmptySquares.count == 0
  end
 
  def somebodyWon
    winningRows = [ [1, 2, 3], [4, 5, 6], [7, 8, 9],
                    [1, 4, 7], [2, 5, 8], [3, 6, 9],
                    [1, 5, 9], [3, 5, 7] ]
    playersRow = winningRows.detect{ |row| onePersonOwnsRow(row) }
    not playersRow.nil?
  end

  def onePersonOwnsRow(row)
    players = row.collect{ |square| @board.getPlayerOn(row) }
    distinctPlayers = players.uniq
    distinctPlayers.count == 1 and not distinctPlayers.first.nil?
  end
end
