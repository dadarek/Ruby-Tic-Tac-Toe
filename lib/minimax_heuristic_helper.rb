class MinimaxHeuristicHelper
  @@POSSIBLE_WINS = [ Set[1, 2, 3], Set[4, 5, 6], Set[7, 8, 9],
                     Set[1, 4, 7], Set[2, 5, 8], Set[3, 6, 9],
                     Set[1, 5, 9], Set[3, 5, 7]
                    ]
  def initialize(player, opponent)
    @player = player
    @opponent = opponent
  end
  
  def value?(next_square)
    if win? next_square
      return 1
    elsif tie?
      return 0
    else
      return -1 * (opponents_best_with next_square)
    end
  end

  def opponents_best_with next_square
    player_new = @player + Array(next_square)
    helper = MinimaxHeuristicHelper.new(@opponent, player_new)
    empty = Array(1..9) - player_new - @opponent
    possible_scores = empty.collect{ |square| helper.value? square }
    possible_scores.max
  end


  def win? next_square
    player_new = @player + Array(next_square)
    MinimaxHeuristicHelper.won? player_new
  end

  def tie?
    8 == @player.count + @opponent.count
  end

  def self.won?(squares)
    set = squares.to_set
    nil != @@POSSIBLE_WINS.detect{ |win| win.subset? set }
  end

end
