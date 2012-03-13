class StreamBoardPrinter
  def initialize(stream=$stdout)
    @stream = stream
  end

  def print(board)
    9.times { |i|
      square = i + 1
      symbol = getSymbol(board, square)
      separator = getSeparator(square)
      @stream.printf symbol
      @stream.printf separator
    }
  end
  
  def print_winner(player)
    @stream.printf player.to_s << " won!\n"
  end

  def print_tie
    @stream.printf "You tied!\n"
  end

  def print_next_turn(player)
    @stream.printf "#{player}'s turn next\n"
  end

  def getSeparator(square)
    square % 3 == 0 ? "\n" : "|"
  end

  def getSymbol(board, square)
    return "x" if isOwner(board, board.p1, square)
    return "o" if isOwner(board, board.p2, square)
    " "
  end

  def isOwner(board, player, square)
    board.playerOwnsSquare(player, square)
  end 
end
