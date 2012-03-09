class Game
  def initialize(board, winnerFinder)
    @board = board  
    @winnerFinder = winnerFinder
  end

  def isOver 
    boardIsFull or not @winnerFinder.winner.nil?
  end

  def boardIsFull
    @board.getEmptySquares.count == 0
  end

end
