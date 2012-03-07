class Heuristic
  def initialize(board)
    @board = board
  end
  def nextMove(player)
    result ||= getLastOpenSquareInRow(player, 1)
    result ||= getLastOpenSquareInRow(player, 2)
    result ||= getLastOpenSquareInRow(player, 3)
    result
  end
  def getLastOpenSquareInRow(player, rowNumber)
    result = nil
    firstSquareInRow = rowNumber * 3 - 2;
    allSquaresInRow = Array.new(3) { |i| firstSquareInRow + i }
    squaresOwnedByPlayer = Array.new
    emptySquares = Array.new
    allSquaresInRow.each do |item|
      if(playerOwnsSquare(player, item))
        squaresOwnedByPlayer.push(item)
      elsif @board.isEmpty(item)
        emptySquares.push(item)
      end
    end
    if squaresOwnedByPlayer.count == 2
      if emptySquares.count == 1
        result = emptySquares[0]
      end
    end
    result
  end
  def playerOwnsSquare(player, square)
    @board.playerAt(square) == player 
  end
end
