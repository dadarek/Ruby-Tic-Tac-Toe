class Heuristic
  @@WINNING_ROWS = [ [1, 2, 3], [4, 5, 6], [7, 8, 9],
                    [1, 4, 7], [2, 5, 8], [3, 6, 9],
                    [1, 5, 9], [3, 5, 7] ]
 
  def initialize(board, player, opponent)
    @board = board
    @player = player
    @opponent = opponent
  end

  def nextMove()
    result ||= firstMove
    result ||= findWinningMoveFor(@player)
    result ||= findWinningMoveFor(@opponent)
    result ||= tryFork()
    result ||= blockFork()
    result ||= centerIfEmpty
    result ||= oppositeCornerIfAny
    result ||= emptySide
  end

  def emptySide
    (@board.getEmptySquares & [2, 4, 6, 8]).first
  end

  def centerIfEmpty
    5 if @board.isEmpty(5)
  end

  def oppositeCornerIfAny
    result ||= getCornerIfOppositeAndOpen(1, 9)
    result ||= getCornerIfOppositeAndOpen(9, 1)
  end

  def getCornerIfOppositeAndOpen(expectedEmpty, expectedOpponent)
    isEmpty = @board.getEmptySquares.include? expectedEmpty
    expectedEmpty if isEmpty
  end
  
  def firstMove
    1 if @board.getEmptySquares.count == 9
  end

  def findWinningMoveFor(somePlayer)
    possibleWin = @@WINNING_ROWS.detect { |row| canWin(row, somePlayer) }
    (possibleWin & @board.getEmptySquares())[0] unless possibleWin.nil?
  end

  def canWin(row, player)
    squaresOwnedByPlayer = row & @board.getPlayerSquares(player)
    emptySquares = row & @board.getEmptySquares()

    squaresOwnedByPlayer.count == 2 and emptySquares.count == 1
  end

  def tryFork()
    possibleWins = @@WINNING_ROWS.select{ |row| playerOwnsRow(row) }
    commonSquares = getCommonSquares(possibleWins)
    commonSquares.detect{ |square| @board.isEmpty(square) }
  end

  def playerOwnsRow(row)
    opponentSquares = row & @board.getPlayerSquares(@opponent)
    playerSquares = row & @board.getPlayerSquares(@player)
    opponentSquares.count == 0 and playerSquares.count > 0
  end

  def getCommonSquares(rows)
    occurences = { }
    (1..9).each{ |i| occurences[i] = 0 }
    rows.each{ |row| row.each{ |square| occurences[square] += 1 } }
    
    occurences.delete_if{ |square, count| count < 2 }
    occurences.keys
  end

  def blockFork()
    result ||= blockOppositeCornersFork
    result ||= blockOneEdgeOneCornerFork([6, 7], 8)
    result ||= blockOneEdgeOneCornerFork([3, 4], 2)
    result ||= blockOneEdgeOneCornerFork([2, 9], 6)
    result ||= blockOneEdgeOneCornerFork([1, 8], 4)
  end

  def blockOneEdgeOneCornerFork(opponentSquares, blockingSquare)
    playerHasOnlyCenter = [5] == @board.getPlayerSquares(@player)
    opponentHasEdgeCornerForkPossible = (opponentSquares & @board.getPlayerSquares(@opponent)) == opponentSquares
    blockingSquare if playerHasOnlyCenter and opponentHasEdgeCornerForkPossible 
  end
  
  def blockOppositeCornersFork
    playerHasOnlyCenter = [5] == @board.getPlayerSquares(@player)
    opponentSquares = @board.getPlayerSquares(@opponent).sort
    opponentHasOppositeCorners = (opponentSquares == [1, 9] or opponentSquares == [3, 7])
    2 if opponentHasOppositeCorners and playerHasOnlyCenter
  end

end
