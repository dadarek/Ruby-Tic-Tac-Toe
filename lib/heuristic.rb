class Heuristic
  @@WINNING_ROWS = [ [1, 2, 3], [4, 5, 6], [7, 8, 9],
                    [1, 4, 7], [2, 5, 8], [3, 6, 9],
                    [1, 5, 9], [3, 5, 7] ]
 
  def next_move(board, player)
    @board = board
    @player = player
    @opponent = determine_opponent
    
    result ||= first_move
    result ||= find_winning_move_for @player
    result ||= find_winning_move_for @opponent
    result ||= try_fork
    result ||= block_opposite_corners_fork
    result ||= block_one_edge_one_corner_fork
    result ||= center_if_empty
    result ||= opposite_corner_if_any
    result ||= empty_corner
    result ||= empty_side
  end
  
  def determine_opponent
    @board.p1 == @player ? @board.p2 : @board.p1
  end

  def empty_corner
    1 if @board.empty? 1
  end
  
  def empty_side
    (@board.get_empty_squares & [2, 4, 6, 8]).first
  end

  def center_if_empty
    5 if @board.empty? 5
  end

  def opposite_corner_if_any
    result ||= take_square_if_opponent_owns(7, 3)
    result ||= take_square_if_opponent_owns(9, 1)
    result ||= take_square_if_opponent_owns(3, 7)
    result ||= take_square_if_opponent_owns(1, 9)
  end

  def take_square_if_opponent_owns(opponent_square, square_to_take)
    square_to_take if (@board.player_owns_square(@opponent, opponent_square) and @board.empty?(square_to_take))
  end
  
  def first_move
    take_square_if_setup_is([], [], 1)
  end

  def find_winning_move_for(some_player)
    possible_win = @@WINNING_ROWS.detect { |row| can_win(row, some_player) }
    (possible_win & @board.get_empty_squares)[0] unless possible_win.nil?
  end

  def can_win(row, player)
    squares_owned_by_player = row & @board.get_player_squares(player)
    empty_squares = row & @board.get_empty_squares

    squares_owned_by_player.count == 2 and empty_squares.count == 1
  end

  def try_fork
    possible_wins = @@WINNING_ROWS.select{ |row| player_owns_row row }
    common_squares = get_common_squares(possible_wins)
    common_squares.detect{ |square| @board.empty? square }
  end

  def player_owns_row(row)
    opponentSquares = row & @board.get_player_squares(@opponent)
    player_squares = row & @board.get_player_squares(@player)
    opponentSquares.count == 0 and player_squares.count > 0
  end

  def get_common_squares(rows)
    occurences = { }
    (1..9).each{ |i| occurences[i] = 0 }
    rows.each{ |row| row.each{ |square| occurences[square] += 1 } }
    
    occurences.delete_if{ |square, count| count < 2 }
    occurences.keys
  end

  def block_one_edge_one_corner_fork
    result ||= take_square_if_setup_is([5], [6, 7], 8)
    result ||= take_square_if_setup_is([5], [3, 4], 2)
    result ||= take_square_if_setup_is([5], [2, 9], 6)
    result ||= take_square_if_setup_is([5], [1, 8], 4)
  end
  
  def block_opposite_corners_fork
    result ||= take_square_if_setup_is([5], [1, 9], 2)
    result ||= take_square_if_setup_is([5], [3, 7], 2)
  end

  def take_square_if_setup_is(player_squares, opponent_squares, square_to_take)
    square_to_take if (owns_squares(@player, player_squares) and owns_squares(@opponent, opponent_squares))
  end

  def owns_squares(player, squares)
    player_squares = @board.get_player_squares player
    squares.sort == player_squares.sort
  end

end
