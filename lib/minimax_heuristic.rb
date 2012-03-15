require 'set'

class MinimaxHeuristic
  @@POSSIBLE_WINS = [ Set[1, 2, 3], Set[4, 5, 6], Set[7, 8, 9],
                     Set[1, 4, 7], Set[2, 5, 8], Set[3, 6, 9],
                     Set[1, 5, 9], Set[3, 5, 7]
                    ]
  def self.score(player_squares, opponent_squares)
    if won? player_squares.to_set
      return 1
    elsif won? opponent_squares.to_set
      return -1
    end
    0
  end

  def self.score_if_takes_square(player_squares, opponent_squares, next_square)
    new_squares = player_squares + Array(next_square)
    score(new_squares, opponent_squares)
  end

  def self.won?(squares)
    nil != @@POSSIBLE_WINS.detect{ |win| win.subset? squares }
  end
  
  def self.contains?(winning_squares, player_squares)
    winning_squares.to_set.subset? player_squares.to_set
  end
end
