class Game
  def initialize(board)
    @board = board  
  end

  def isOver 
    finder = WinnerFinder.new(@board)
    boardIsFull or not finder.winner.nil?
  end

  def boardIsFull
    @board.getEmptySquares.count == 0
  end
 
end
