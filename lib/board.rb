class Board
  attr_accessor :p1, :p2

  def initialize(p1, p2)
    @squares = {}
    @p1 = p1
    @p2 = p2
  end

  def take(square, player)
    @squares[square] = player
  end

  def empty?(square)
    @squares[square].nil?
  end

  def player_owns_square(player, square)
    @squares[square] == player
  end
  
  def get_player_squares(player)
    @squares.collect{ |key, value| key if value == player }.compact()
  end

  def get_empty_squares
    (1..9).select{ |i| @squares[i].nil? }
  end
end

