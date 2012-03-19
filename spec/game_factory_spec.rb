require 'game_factory'
require 'computer_player'
require 'human_player'
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
    
    create_game_and_assert_values(factory, p1, p2, ui, 1)
    create_game_and_assert_values(factory, p2, p1, ui, 2)
    create_game_and_assert_values(factory, p2, p1, ui, 3)
  end

  it "creates 2 computer players" do
    factory = GameFactory.new(nil, nil, nil, nil, nil)

    players = factory.create_computer_vs_computer
    players[0].class.should == ComputerPlayer
    players[1].class.should == ComputerPlayer
  end

  it "creates computer and player in correct order" do
    ui = DummyUI.new
    ui.go_first_responses = [true, false]
    factory = GameFactory.new(nil, nil, nil, nil, ui)

    players = factory.create_computer_vs_player
    players[0].class.should == HumanPlayer 
    players[1].class.should == ComputerPlayer

    players = factory.create_computer_vs_player
    players[0].class.should == ComputerPlayer
    players[1].class.should == HumanPlayer 
  end

  it "creates human with ui" do
    ui = "Some UI"
    factory = GameFactory.new(nil, nil, nil, nil, ui)

    player = factory.create_human
    player.ui.should == ui
  end


  def create_game_and_assert_values(factory, expected_p1, expected_p2, expected_ui, expected_number_of_games)
    game = factory.create
    game.board.p1.should == expected_p1
    game.board.p2.should == expected_p2
    game.ui.should == expected_ui
    DummyGame.games_created.should == expected_number_of_games
    DummyGame.games_played.should == 0
    expected_ui.times_asked_to_go_first.should == expected_number_of_games
  end
end
