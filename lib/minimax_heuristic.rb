require 'set'
require 'minimax_heuristic_helper'

class MinimaxHeuristic
  def next_move(board, player)
    helper = MinimaxHeuristicHelper.new(board, player)
    helper.next_move
  end
end
