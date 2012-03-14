class WinnerFinder
  @@WINNING_SQUARES = [ [1, 2, 3], [4, 5, 6], [7, 8, 9], 
                       [1, 4, 7], [2, 5, 8], [3, 6, 9],
                       [1, 5, 9], [3, 5, 7] ]
  def self.winner_of(board)
    check_if_winner(board, board.p1) or check_if_winner(board, board.p2)
  end

  def self.check_if_winner(board, player)
    player if @@WINNING_SQUARES.detect{ |row| player_owns_squares(board, player, row) } 
  end

  def self.player_owns_squares(board, player, squares)
    player if (squares & board.get_player_squares(player) == squares)
  end

end

