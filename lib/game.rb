class Game
  def initialize(board, winner_finder, ui, p1, p2)
    @board = board  
    @winner_finder = winner_finder
    @ui = ui
    @p1 = p1
    @p2 = p2
  end

  def over? 
    board_full? or not @winner_finder.winner.nil?
  end

  def board_full?
    @board.get_empty_squares.count == 0
  end

  def go
    @ui.refresh @board
    
    play_game
    announce_winner_or_tie
  end

  def play_game
    current_player = nil

    while not over? do
      current_player = current_player == @p1 ? @p2 : @p1
      @ui.announce_next_turn current_player
      next_move = current_player.next_move
      @board.take(next_move, current_player)
      @ui.refresh @board
    end
  end

  def announce_winner_or_tie
    winner = @winner_finder.winner
    winner.nil? ? @ui.announce_tie : @ui.announce_winner(winner)
  end

end
