class ThreeInARow
  def initialize
    @isEmpty = true
    @squaresTaken = {}
  end
  def isEmpty
    @isEmpty
  end
  def take(square, player)
    @isEmpty = false
    @squaresTaken[player] = 0 if @squaresTaken[player].nil?
    @squaresTaken[player] += 1
  end
  def canPlayerWinWithOneMove(player)
    @squaresTaken[player] == 2 and @squaresTaken.length == 1
  end
  def canPlayerWinWithTwoMoves(player)
    @squaresTaken[player] == 1 and @squaresTaken.length == 1
  end
  def canPlayerWinWithAnyNumberOfMoves(player)
    isEmpty or canPlayerWinWithOneMove(player) or canPlayerWinWithTwoMoves(player)
  end
end
