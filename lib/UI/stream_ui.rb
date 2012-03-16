class StreamUI
  def initialize(stream=$stdout, in_stream=$stdin, out_stream=$stdout)
    @stream = stream
  end

  def refresh(board)
    9.times { |i|
      square = i + 1
      symbol = symbol_for(board, square)
      separator = separator_for(square)
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

  def separator_for(square)
    square % 3 == 0 ? "\n" : "|"
  end

  def symbol_for(board, square)
    return "x" if owner?(board, board.p1, square)
    return "o" if owner?(board, board.p2, square)
    " "
  end

  def owner?(board, player, square)
    board.player_owns_square(player, square)
  end 
end
