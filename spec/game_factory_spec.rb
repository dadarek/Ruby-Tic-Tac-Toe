require 'game_factory'
require 'dummies/dummy_game'

describe GameFactory do
  it "creates a game with given board, players, and UI" do
    p1 = "P1"
    p2 = "P2"
    ui = "UI"

    factory = GameFactory.new(DummyGame, DummyBoard, p1, p2, ui)
    game = factory.create

    game.board.p1.should == p1
    game.board.p2.should == p2
    game.ui.should == ui

    DummyGame.games_created.should == 1
    DummyGame.games_played.should == 0
  end

  class DummyBoard
    attr_accessor :p1, :p2
    
    def initialize(p1, p2)
      @p1 = p1
      @p2 = p2
    end
  end
end
