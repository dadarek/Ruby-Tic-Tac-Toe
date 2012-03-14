class GameRunner
  def initialize(prompter, game_factory)
    @prompter = prompter
    @game_factory = game_factory
  end

  def go
    begin
      game = @game_factory.create
      game.play
    end while @prompter.play_again?
  end
end
