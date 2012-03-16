class GameRunner
  def initialize(ui, game_factory)
    @ui = ui
    @game_factory = game_factory
  end

  def go
    begin
      game = @game_factory.create
      game.play
    end while @ui.play_again?
  end
end
