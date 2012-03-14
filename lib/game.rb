class Game
  def initialize(board, winner_finder, board_printer, p1, p2)
    @board = board  
    @winner_finder = winner_finder
    @board_printer = board_printer
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
    current_player = nil
    while not over? do
      current_player = current_player == @p1 ? @p2 : @p1
      @board_printer.print_next_turn current_player
      next_move = current_player.next_move
      @board.take(next_move, current_player)
      @board_printer.print(@board)
    end

    winner = @winner_finder.winner
    winner.nil? ? @board_printer.print_tie : @board_printer.print_winner(winner)
  end

end
