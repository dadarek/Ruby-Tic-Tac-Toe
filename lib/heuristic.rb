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
    allSquaresInRow = getSquaresInRow(rowNumber) 
    squaresOwnedByPlayer = getSquaresOwnedByPlayer(allSquaresInRow, player)
    emptySquares = getEmptySquares(allSquaresInRow)
    if squaresOwnedByPlayer.count == 2
      if emptySquares.count == 1
        result = emptySquares[0]
      end
    end
    result
  end
  def getSquaresInRow(rowNumber)
    firstSquareInRow = rowNumber * 3 - 2
    Array.new(3) { |i| firstSquareInRow + i }
  end
  def getSquaresOwnedByPlayer(squares, player)
    result = Array.new
    squares.each do |square|
      if @board.playerOwnsSquare(player, square)
        result.push(square)
      end
    end
    result
  end
  def getEmptySquares(squares)
    result = Array.new
    squares.each do |square|
      if @board.isEmpty(square)
        result.push(square)
      end
    end
    result
  end
end
