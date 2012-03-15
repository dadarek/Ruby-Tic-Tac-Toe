require 'set'

class MinimaxHeuristic
# @@POSSIBLE_WINS = [ [1, 2, 3], [4, 5, 6], [7, 8, 9],
#                     [1, 4, 7], [2, 5, 8], [3, 6, 9],
#                     [1, 5, 9], [3, 5, 7] ]
  def self.score(player_squares, opponent_squares)
    if contains?([1, 4, 7], player_squares)
      return 1
    elsif contains?([1, 4, 7], opponent_squares)
      return -1
    end
    0
  end
  
  def self.contains?(winning_squares, player_squares)
    winning_squares.to_set.subset? player_squares.to_set
  end
end
