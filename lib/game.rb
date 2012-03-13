class Game
  def initialize(board, winnerFinder, boardPrinter, p1, p2)
    @board = board  
    @winnerFinder = winnerFinder
    @boardPrinter = boardPrinter
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
    current_player = nil
    while not isOver do
      current_player = current_player == @p1 ? @p2 : @p1
      @board.take(current_player.nextMove, current_player)
      @boardPrinter.print(@board)
    end

    winner = @winnerFinder.winner
    @boardPrinter.print_winner winner unless winner.nil?
  end

end
