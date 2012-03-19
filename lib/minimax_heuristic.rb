require 'set'
require 'minimax_heuristic_helper'
require 'board'

class MinimaxHeuristic
  def next_move(board, player)
    player_squares = board.get_player_moves
    opponent_squares = get_opponent_moves(board, player)
    
    helper = MinimaxHeuristicHelper.new(player_squares, opponent_squares)
    helper.next_move
  end

  def get_opponent_moves(board, player)
    opponent = board.p1 == player ? board.p2 : board.p1
    board.get_player_moves opponent
  end
end
