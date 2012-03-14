class DummyGame
  @@total_games_created = 0
  @@total_games_played = 0

  attr_accessor :board, :ui

  def initialize(board, ui)
    @board = board
    @ui = ui
    @@total_games_created += 1
  end

  def play
    @@total_games_played += 1
  end

  def self.games_played
    @@total_games_played
  end

  def self.games_created
    @@total_games_created
  end
  
  def self.reset_stats
    @@total_games_played = 0
    @@total_games_created = 0
  end
end  

