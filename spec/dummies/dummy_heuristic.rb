class DummyHeuristic
  def initialize
    @moves_in_order = [5, 7, 2, 9, 8]
  end
  
  def next_move(board, player)
    @moves_in_order.pop
  end
end
