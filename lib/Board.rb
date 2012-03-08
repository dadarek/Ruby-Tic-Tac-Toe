class Board
  def initialize
    @squares = {}
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
  def getOpponentSquares(player)
    allSquares = Array(1..9) 
    allSquares - getEmptySquares() - getPlayerSquares(player)
  end
  def getEmptySquares()
    (1..9).select{ |i| @squares[i].nil? }
  end
end

