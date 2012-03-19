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
    assert_players(players, ComputerPlayer, ComputerPlayer)
  end

  it "creates computer and player in correct order" do
    ui = DummyUI.new
    ui.go_first_responses = [true, false]
    factory = GameFactory.new(nil, nil, nil, nil, ui)

    players = factory.create_computer_vs_human
    assert_players(players, HumanPlayer, ComputerPlayer)

    players = factory.create_computer_vs_human
    assert_players(players, ComputerPlayer, HumanPlayer)
  end

  it "creates human with ui" do
    ui = "Some UI"
    factory = GameFactory.new(nil, nil, nil, nil, ui)

    player = factory.create_human
    player.ui.should == ui
  end

  it "creates appropriate players according to ui" do
    ui = DummyUI.new
    ui.go_first_responses = [false, true, false]
    ui.computer_vs_computer_responses = [false, true, true, false, false]
    
    factory = GameFactory.new(nil, nil, nil, nil, ui)
    players = factory.create_players
    assert_players(players, ComputerPlayer, HumanPlayer)
    players = factory.create_players
    assert_players(players, ComputerPlayer, ComputerPlayer)
    players = factory.create_players
    assert_players(players, ComputerPlayer, ComputerPlayer)
    players = factory.create_players
    assert_players(players, HumanPlayer, ComputerPlayer)
    players = factory.create_players
    assert_players(players, ComputerPlayer, HumanPlayer)
  end

  def assert_players(players, expected_first_player, expected_second_player)
    players[0].class.should == expected_first_player
    players[1].class.should == expected_second_player
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
