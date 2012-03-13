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

  def isEmpty(square)
    @squares[square].nil?
  end

  def playerOwnsSquare(player, square)
    @squares[square] == player
  end
  
  def getPlayerSquares(player)
    @squares.collect{ |key, value| key if value == player }.compact()
  end

  def getEmptySquares()
    (1..9).select{ |i| @squares[i].nil? }
  end
end

