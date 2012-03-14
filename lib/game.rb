class Game
  def initialize(board, ui, winner_finder=WinnerFinder.new)
    @board = board  
    @winner_finder = winner_finder
    @ui = ui
  end

  def over? 
    board_full? or not winner.nil?
  end

  def board_full?
    @board.get_empty_squares.count == 0
  end

  def go
    @ui.refresh @board
    
    begin 
      play_game
      announce_winner_or_tie
    end while @ui.play_again?
  end

  def play_game
    current_player = nil

    while not over? do
      current_player = current_player == @board.p1 ? @board.p2 : @board.p1
      @ui.announce_next_turn current_player
      next_move = current_player.next_move @board
      @board.take(next_move, current_player)
      @ui.refresh @board
    end
  end

  def announce_winner_or_tie
    winner.nil? ? @ui.announce_tie : @ui.announce_winner(winner)
  end

  def winner
    @winner_finder.winner_of @board
  end
end
