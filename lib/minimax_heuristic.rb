class MinimaxHeuristic
# @@POSSIBLE_WINS = [ [1, 2, 3], [4, 5, 6], [7, 8, 9],
#                     [1, 4, 7], [2, 5, 8], [3, 6, 9],
#                     [1, 5, 9], [3, 5, 7] ]
  def score(player_squares, opponent_squares)
    [1, 4, 7] & player_squares == [1, 4, 7] ? 1 : 0
  end
end
