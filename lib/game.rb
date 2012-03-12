class Game
  def initialize(board, winnerFinder, p1, p2)
    @board = board  
    @winnerFinder = winnerFinder
    @p1 = p1
    @p2 = p2
  end

  def isOver 
    boardIsFull or not @winnerFinder.winner.nil?
  end

  def boardIsFull
    @board.getEmptySquares.count == 0
  end

  def go()
    currentPlayer = nil
    while not isOver do
      if currentPlayer == @p1 then
        currentPlayer = @p2
        mark = "o"
      else
        currentPlayer = @p1
        mark = "x"
      end

      @board.take(currentPlayer.nextMove, mark)
    end
  end

end
