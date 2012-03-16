require 'set'

class WinnerFinder
  @@WINNING_SQUARES = [ Set[1, 2, 3], Set[4, 5, 6], Set[7, 8, 9], 
                        Set[1, 4, 7], Set[2, 5, 8], Set[3, 6, 9],
                        Set[1, 5, 9], Set[3, 5, 7] ]
  def self.winner_of(board)
    result ||= (board.p1 if winner?(board, board.p1))
    result ||= (board.p2 if winner?(board, board.p2))
  end

  def self.winner?(board, player)
    player_squares = board.get_player_squares player
    player_squares = player_squares.to_set
    nil != @@WINNING_SQUARES.detect{ |winning_squares| winning_squares.subset? player_squares}
  end

end

