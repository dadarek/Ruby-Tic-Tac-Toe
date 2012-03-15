require 'set'

class MinimaxHeuristic
  @@POSSIBLE_WINS = [ Set[1, 2, 3], Set[4, 5, 6], Set[7, 8, 9],
                     Set[1, 4, 7], Set[2, 5, 8], Set[3, 6, 9],
                     Set[1, 5, 9], Set[3, 5, 7]
                    ]
  def self.score(player, opponent)
    if won? player.to_set
      return 1
    elsif won? opponent.to_set
      return -1
    end
    0
  end

  def self.score_if_takes_square(player, opponent, next_square)
    new_player = player + Array(next_square)

    result = score(new_player, opponent)
    if result == 0 and not last_move?(new_player, opponent)
      last_squares = Array(1..9) - new_player - opponent
      last_squares.each{ |square|
        result -= score_if_takes_square(opponent, new_player, square)
      }
    end
    result
  end

  def self.last_move?(player, opponent)
    player.count + opponent.count == 9
  end

  def self.won?(squares)
    nil != @@POSSIBLE_WINS.detect{ |win| win.subset? squares }
  end
end
