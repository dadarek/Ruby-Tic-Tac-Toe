require 'game_runner'
require 'dummies/dummy_game'

describe GameRunner do
  it "create x games and plays that many times" do
    prompter = DummyPrompter.new
    prompter.times_to_play = 5

    factory = DummyFactory.new

    runner = GameRunner.new(prompter, factory)
    runner.go

    prompter.times_play_again_asked.should == 5
    factory.games_created.should == 5
    DummyGame.games_played.should == 5
  end
  
  class DummyPrompter
    attr_accessor :times_to_play, :times_play_again_asked

    def initialize
      @times_play_again_asked = 0
    end

    def play_again?
      @times_play_again_asked += 1
      @times_to_play > @times_play_again_asked
    end
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
