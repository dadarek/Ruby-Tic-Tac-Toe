require 'computer_player'
require 'minimax_heuristic'

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

  def create_players
    @ui.comp_vs_comp ? create_computer_vs_computer : create_computer_vs_human
  end

  def create_computer_vs_computer
    [create_computer, create_computer]
  end

  def create_computer_vs_human
    human = create_human
    computer = create_computer

    go_first = @ui.go_first?
    p1 = go_first ? human : computer
    p2 = go_first ? computer : human
    
    [p1, p2]
  end
  
  def create_computer
   ComputerPlayer.new MinimaxHeuristic.new 
  end

  def create_human
    HumanPlayer.new @ui
  end
end
