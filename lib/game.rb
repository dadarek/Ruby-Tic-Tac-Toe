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

  def play
    @current_player = @board.p1
    @ui.refresh @board
    play_game
    announce_winner_or_tie
  end

  def play_game
    while not over? do
      @ui.announce_next_turn @current_player
      make_next_move
      @ui.refresh @board
      move_to_next_player
    end
  end

  def make_next_move
    next_move = nil
    begin
      next_move = @current_player.next_move @board
    end until @board.empty? next_move
    @board.take(next_move, @current_player)
  end

  def move_to_next_player
    if @current_player == @board.p1 then
      @current_player = @board.p2
    else
      @current_player = @board.p1
    end
  end

  def announce_winner_or_tie
    winner.nil? ? @ui.announce_tie : @ui.announce_winner(winner)
  end

  def winner
    @winner_finder.winner_of @board
  end
end
