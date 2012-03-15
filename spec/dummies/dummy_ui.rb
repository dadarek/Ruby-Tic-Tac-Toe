class DummyUI
  attr_accessor :times_board_refreshed, :winner_announced,
    :tie_announced, :times_next_turn_announced

  def initialize
    @times_board_refreshed = 0
    @times_next_turn_announced = 0
  end

  def refresh(board)
    @times_board_refreshed += 1
  end
  
  def announce_winner(player)
    @winner_announced = player
  end

  def announce_tie
    @tie_announced = true
  end

  def announce_next_turn(player)
    @times_next_turn_announced += 1
  end 
end
