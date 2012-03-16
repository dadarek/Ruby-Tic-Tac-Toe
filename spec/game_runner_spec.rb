require 'game_runner'
require 'dummies/dummy_game'
require 'dummies/dummy_ui'
require 'dummies/dummy_factory'

describe GameRunner do
  it "create x games and plays that many times" do
    times_to_play = 5

    DummyGame.reset_stats

    ui = DummyUI.new
    ui.times_to_play_again = times_to_play
    
    factory = DummyFactory.new

    runner = GameRunner.new(ui, factory)
    runner.go

    ui.times_asked_to_play_again.should == times_to_play
    factory.games_created.should == times_to_play

    DummyGame.games_played.should == times_to_play
    DummyGame.games_created.should == times_to_play
  end
  
end
