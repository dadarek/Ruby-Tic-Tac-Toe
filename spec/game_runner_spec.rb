require 'game_runner'
require 'dummies/dummy_game'
require 'dummies/dummy_prompter'

describe GameRunner do
  it "create x games and plays that many times" do
    DummyGame.reset_stats

    prompter = DummyPrompter.new
    prompter.times_to_play = 5

    factory = DummyFactory.new

    runner = GameRunner.new(prompter, factory)
    runner.go

    prompter.times_play_again_asked.should == 5
    factory.games_created.should == 5

    DummyGame.games_played.should == 5
    DummyGame.games_created.should == 5
  end
  
  class DummyFactory
    attr_accessor :games_created

    def initialize
      @games_created = 0
    end

    def create
      @games_created += 1
      DummyGame.new(nil, nil)
    end
  end
end
