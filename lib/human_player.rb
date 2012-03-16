class HumanPlayer
  def initialize(ui)
    @ui = ui 
  end

  def next_move(board)
    @ui.get_square
  end

  def to_s
    "You"
  end
end
