class DummyPlayer
  def self.reset_counter 
    @@callback_counter = 0
  end

  def initialize
    @order_called = Array.new
  end

  def set_moves(moves)
    @moves = moves
  end

  def next_move(board)
    @order_called.push(@@callback_counter += 1)
    @moves.pop
  end

  def order_called
    @order_called
  end
end
