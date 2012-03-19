require 'board'

class MinimaxHeuristicHelper
  @@POSSIBLE_WINS = [ Set[1, 2, 3], Set[4, 5, 6], Set[7, 8, 9],
                     Set[1, 4, 7], Set[2, 5, 8], Set[3, 6, 9],
                     Set[1, 5, 9], Set[3, 5, 7]
                    ]

  def initialize(player_squares, opponent_squares)
    @player_squares = player_squares
    @opponent_squares = opponent_squares
    @empty_squares = Array(1..9) - player_squares - opponent_squares
  end

  def next_move
    result ||= 1 if @empty_squares.count == 9
    result ||= @empty_squares.detect{ |square| 1 == score(@player_squares + Array(square), @opponent_squares) }
    result ||= @empty_squares.max_by{ |square| score_if_takes_square(@player_squares, @opponent_squares, square) }
  end

  def score(player, opponent)
    if won?
      return 1
    elsif lost?
      return -1
    end
    0
  end

  def score_if_takes_square(next_square)
    result = nil

    if will_win? next_square
      result = 1
    elsif will_lose? next_square
      result = -1
    elsif no_moves_left?
      result = 0
    else
      new_player_squares = player + Array(next_square)
      open_squares = Array(1..9) - new_player_squares - opponent_squares

      best_square = open_squares.min_by{ |square|
        helper = MinimaxHeuristicHelper.new(@board, @opponent)
        helper.score_if_takes_square(opponent_squares, new_player_squares, square)
      }
      
      helper = MinimaxHeuristicHelper.new(@board, @opponent)
      result = helper.score_if_takes_square(opponent_squares, new_player_squares, best_square)
    end
    result
  end

  def no_moves_left?
    9 == player_squares.count + opponent_squares.count
  end

  def will_win? square
    new_squares = @player_squares + Array(square)
    HeuristicHelper.winning_squares? new_squares.to_set
  end

  def will_lose? square
    HeuristicHelper.winning_squares? opponent_squares.to_set
  end

  def self.winning_squares?(squares)
    nil != @@POSSIBLE_WINS.detect{ |win| win.subset? squares }
  end

  def player_squares
    @board.get_player_squares @player
  end

  def opponent_squares
    @board.get_player_squares @opponent
  end

  def empty_squares
    @board.get_empty_squares
  end
end
