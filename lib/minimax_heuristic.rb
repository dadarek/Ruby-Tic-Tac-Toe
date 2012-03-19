require 'set'
require 'minimax_heuristic_helper'

class MinimaxHeuristic
  def next_move(board, player)
    opponent = player == board.p1 ? board.p2 : board.p1
    opponent_squares = board.get_player_squares opponent
    
    player_squares = board.get_player_squares player

    empty_squares = board.get_empty_squares

    result ||= 1 if empty_squares.count == 9
    result ||= empty_squares.detect{ |square| 1 == MinimaxHeuristicHelper.score(player_squares + Array(square), opponent_squares) }
    result ||= empty_squares.max_by{ |square| MinimaxHeuristicHelper.score_if_takes_square(player_squares, opponent_squares, square) }
  end
end
