class GameFactory
  def initialize(game_class, board_class, p1, p2, ui)
    @game_class = game_class
    @board_class = board_class
    @p1 = p1
    @p2 = p2
    @ui = ui
  end
  
  def create
    board = @board_class.new(@p1, @p2)
    @game_class.new(board, @ui)
  end
end
