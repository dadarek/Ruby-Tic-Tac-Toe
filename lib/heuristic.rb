class Heuristic
	@@WINNING_ROWS = [  [1, 2, 3], [4, 5, 6], [7, 8, 9],
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
    result = nil

		@@WINNING_ROWS.each do |row|
    	squaresOwnedByPlayer = getSquaresOwnedByPlayer(row, player)
    	emptySquares = getEmptySquares(row)

    	if squaresOwnedByPlayer.count == 2
      	if emptySquares.count == 1
      	  result ||= emptySquares[0]
      	end
    	end
		end
		result
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
