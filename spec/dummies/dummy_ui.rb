class DummyUI
  attr_accessor :times_board_refreshed, 
                :times_square_got,
                :times_tie_announced, 
                :times_next_turn_announced,
                :times_to_play_again,
                :times_asked_to_play_again,
                :times_asked_to_go_first,
                :winner_announced

  def initialize
    @times_board_refreshed = 0
    @times_square_got = 0
    @times_tie_announced = 0
    @times_next_turn_announced = 0
    @times_asked_to_play_again = 0
    @times_asked_to_go_first = 0
  end

  def refresh(board)
    @times_board_refreshed += 1
  end
  
  def announce_winner(player)
    @winner_announced = player
  end

  def announce_tie
    @times_tie_announced += 1
  end

  def announce_next_turn(player)
    @times_next_turn_announced += 1
  end 

  def play_again?
    @times_asked_to_play_again += 1
    (@times_to_play_again -= 1) > 0
  end

  def go_first?
    @times_asked_to_go_first += 1
  end

  def get_square
    @times_square_got += 1
  end
end
