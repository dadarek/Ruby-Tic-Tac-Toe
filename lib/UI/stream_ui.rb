class StreamUI
  def initialize(in_stream=$stdin, out_stream=$stdout)
    @in = in_stream
    @out = out_stream
  end

  def refresh(board)
    9.times { |i|
      square = i + 1
      symbol = symbol_for(board, square)
      separator = separator_for(square)
      @out.printf symbol
      @out.printf separator
    }
  end
  
  def announce_winner(player)
    @out.printf player.to_s << " won!\n"
  end

  def announce_tie
    @out.printf "You tied!\n"
  end

  def announce_next_turn(player)
    @out.printf "#{player}'s turn next\n"
  end

  def get_square
    input = @in.gets.to_i 
    ((1..9).include? input) ? input : get_square
  end

  def play_again?
    result = input_to_bool
    result.nil? ? go_first? : result
  end

  def go_first?
    result = input_to_bool
    result.nil? ? go_first? : result
  end

  def input_to_bool
    value = @in.gets
    value = value.upcase if value.respond_to? :upcase
    return true if ["YES", "Y"].include? value 
    return false if ["NO", "N"].include? value
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
