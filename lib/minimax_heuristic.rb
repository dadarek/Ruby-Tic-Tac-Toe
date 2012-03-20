require 'set'
require_relative 'minimax_heuristic_helper'

class MinimaxHeuristic
  def next_move(board, player)
    opponent = player == board.p1 ? board.p2 : board.p1
    opponent_squares = board.get_player_squares opponent
    player_squares = board.get_player_squares player

    helper = MinimaxHeuristicHelper.new(player_squares, opponent_squares)

    empty_squares = board.get_empty_squares

    result ||= 1 if empty_squares.count == 9
    result ||= empty_squares.max_by{ |square| helper.value? square }
  end
end
