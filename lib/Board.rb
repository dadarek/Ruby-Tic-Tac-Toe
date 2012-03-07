class Board
  def initialize()
    @squares = {}
  end
  def takeSquare(square, player)
    @squares[square] = player
  end

  def isEmpty(square)
    @squares[square].nil?
  end
  def playerAt(square)
    @squares[square]
  end
end

