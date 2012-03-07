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
  def playerOwnsSquare(player, square)
    @squares[square] == player
  end
end

