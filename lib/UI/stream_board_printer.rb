class StreamBoardPrinter
  def initialize(stream=$stdout)
    @stream = stream
  end

  def refresh(board)
    9.times { |i|
      square = i + 1
      symbol = get_symbol(board, square)
      separator = get_separator(square)
      @stream.printf symbol
      @stream.printf separator
    }
  end
  
  def announce_winner(player)
    @stream.printf player.to_s << " won!\n"
  end

  def announce_tie
    @stream.printf "You tied!\n"
  end

  def announce_next_turn(player)
    @stream.printf "#{player}'s turn next\n"
  end

  def get_separator(square)
    square % 3 == 0 ? "\n" : "|"
  end

  def get_symbol(board, square)
    return "x" if is_owner(board, board.p1, square)
    return "o" if is_owner(board, board.p2, square)
    " "
  end

  def is_owner(board, player, square)
    board.player_owns_square(player, square)
  end 
end
