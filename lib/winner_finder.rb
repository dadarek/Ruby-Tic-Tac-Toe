class WinnerFinder
  @@WINNING_SQUARES = [ [1, 2, 3], [4, 5, 6], [7, 8, 9], 
                       [1, 4, 7], [2, 5, 8], [3, 6, 9],
                       [1, 5, 9], [3, 5, 7] ]
  def initialize(board)
    @board = board
  end

  def winner
    check_if_winner(@board.p1) or check_if_winner(@board.p2)
  end

  def check_if_winner(player)
    player if @@WINNING_SQUARES.detect{ |row| player_owns_squares(player, row) } 
  end

  def player_owns_squares(player, squares)
    player if (squares & @board.get_player_squares(player) == squares)
  end

end

