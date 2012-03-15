require 'set'

class MinimaxHeuristic
  @@POSSIBLE_WINS = [ Set[1, 2, 3], Set[4, 5, 6], Set[7, 8, 9],
                     Set[1, 4, 7], Set[2, 5, 8], Set[3, 6, 9],
                     Set[1, 5, 9], Set[3, 5, 7]
                    ]
  def self.score(player_squares, opponent_squares)
    h = MinimaxHeuristic.new(player_squares, opponent_squares)
    h.score_of
  end
  
  def initialize(player_squares, opponent_squares)
    @player_squares = player_squares
    @opponent_squares = opponent_squares
  end

  def score_of
    if won? @player_squares.to_set
      return 1
    elsif won? @opponent_squares.to_set
      return -1
    end
    0
  end
    

  def self.score_if_takes_square(player_squares, opponent_squares, next_square)
    result = nil
    if player_squares.count + opponent_squares.count == 8
      result = score(player_squares + Array(next_square), opponent_squares)
    elsif player_squares.count + opponent_squares.count == 7
      result = score(player_squares + Array(next_square), opponent_squares)
      if result == 0
        last_square = Array(1..9) - player_squares - opponent_squares - Array(next_square)
        result = score(player_squares + Array(next_square), opponent_squares + Array(last_square))
      end
    end
    result
  end

  def won?(squares)
    nil != @@POSSIBLE_WINS.detect{ |win| win.subset? squares }
  end
  
  def contains?(winning_squares, player_squares)
    winning_squares.to_set.subset? player_squares.to_set
  end
end
