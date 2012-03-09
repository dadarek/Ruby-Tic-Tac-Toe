class WinnerFinder

  def winnerOf(board)
    "x" if board.getEmptySquares().count < 7
  end

end

