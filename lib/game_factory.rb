class GameFactory
  def initialize(game_class, board_class, human, computer, ui)
    @game_class = game_class
    @board_class = board_class
    @human = human
    @computer = computer
    @ui = ui
  end
  
  def create
    go_first = @ui.go_first?
    p1 = go_first ? @human: @computer
    p2 = go_first ? @computer: @human
    
    board = @board_class.new(p1, p2)
    @game_class.new(board, @ui)
  end
end
