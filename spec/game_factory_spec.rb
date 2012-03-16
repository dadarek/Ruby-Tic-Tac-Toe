require 'game_factory'
require 'dummies/dummy_game'
require 'dummies/dummy_board'
require 'dummies/dummy_ui'

describe GameFactory do
  it "creates a game with given board, players, and UI" do
    p1 = "P1"
    p2 = "P2"
    ui = DummyUI.new
    ui.go_first_responses = [true, false, false]
    

    factory = GameFactory.new(DummyGame, DummyBoard, p1, p2, ui)
    game = factory.create

    game.board.p1.should == p1
    game.board.p2.should == p2
    game.ui.should == ui

    DummyGame.games_created.should == 1
    DummyGame.games_played.should == 0
    
    ui.times_asked_to_go_first.should == 1
  end
end
