class StreamUI
  @@MESSAGE_GO_FIRST = "Do you want to go first? "
  @@MESSAGE_PLAY_AGAIN = "You wanna play again? "
  @@MESSAGE_COMP_VS_COMP = "Computer v.s. Computer? "
  @@MESSAGE_SELECT_SQUARE = "Select a square (1-9): "

  def initialize(in_stream=$stdin, out_stream=$stdout)
    @in = in_stream
    @out = out_stream
  end

  def refresh(board)
    9.times { |i|
      square = i + 1
      symbol = symbol_for(board, square)
      separator = separator_for(square)
      print symbol
      print separator
    }
  end
  
  def announce_winner(player)
    print_line player.to_s << " won!"
  end

  def announce_tie
    print_line "You tied!"
  end

  def announce_next_turn(player)
    print_line "#{player}'s turn next"
  end

  def get_square
    print @@MESSAGE_SELECT_SQUARE
    input = @in.gets
    input = input.to_i if input.respond_to? :to_i
    ((1..9).include? input) ? input : get_square
  end

  def play_again?
    print @@MESSAGE_PLAY_AGAIN
    result = input_to_bool
    result.nil? ? play_again? : result
  end

  def comp_vs_comp?
    print @@MESSAGE_COMP_VS_COMP
    result = input_to_bool
    result.nil? ? comp_vs_comp? : result
  end

  def go_first?
    print @@MESSAGE_GO_FIRST
    result = input_to_bool
    result.nil? ? go_first? : result
  end

  def input_to_bool
    value = @in.gets
    value = value.upcase if value.respond_to? :upcase
    value = value.strip if value.respond_to? :strip
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

  def print(s)
    @out.printf s
  end

  def print_line(s)
    @out.printf s
    @out.printf "\n"
  end
end
