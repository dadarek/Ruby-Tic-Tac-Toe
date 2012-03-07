class Heuristic
  def nextMove(player, board)
    result ||= getLastOpenSquareInRow(player, board, 1)
    result ||= getLastOpenSquareInRow(player, board, 2)
    result ||= getLastOpenSquareInRow(player, board, 3)
    result
  end
  def getLastOpenSquareInRow(player, board, rowNumber)
    result = nil
    firstSquareInRow = rowNumber * 3 - 2;
    allSquaresInRow = Array.new(3) { |i| firstSquareInRow + i }
    squaresOwnedByPlayer = Array.new
    emptySquares = Array.new
    allSquaresInRow.each do |item|
      if(playerOwnsSquare(player, board, item))
        squaresOwnedByPlayer.push(item)
      elsif board.playerAt(item).nil?
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
  def playerOwnsSquare(player, board, square)
    board.playerAt(square) == player 
  end
end
